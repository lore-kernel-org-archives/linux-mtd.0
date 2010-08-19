Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Olzm3-0005sT-Tf
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2010 07:42:57 +0000
Message-ID: <4C6CE079.7040002@parrot.com>
Date: Thu, 19 Aug 2010 09:42:49 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH 3/4 v2] lib: add crc16_le helper
References: <201008181401.15328.florian@openwrt.org>
	<OF455F8776.C288C2AE-ONC1257783.0055D496-C1257783.00566B4E@transmode.se>
	<4C6C05E3.3090204@parrot.com>
	<OF8F15EED9.913A4211-ONC1257783.005A5474-C1257783.005B148E@transmode.se>
In-Reply-To: <OF8F15EED9.913A4211-ONC1257783.005A5474-C1257783.005B148E@transmode.se>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <florian@openwrt.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Joakim Tjernlund a écrit :
> Matthieu CASTET <matthieu.castet@parrot.com> wrote on 2010/08/18 18:10:11:
>>> if so, 0x8005 looks
>>> wrong too. see CRCPOLY_LE resp. CRCPOLY_BE for an idea.
>> Why ?
> 
> Because changing endian of crc also require the POLY
> to be bit reversed as well. See:
>  #define CRCPOLY_LE 0xedb88320
>  #define CRCPOLY_BE 0x04c11db7
> So I assume you need to do that as well for crc16_be, otherwise it
> won't be a BE version of the standard crc16 LE
Well it match the crc provided in onfi nand [1]. But it may be not a 
real BE version.


> 
>>> What is this crc sum used for?
>> Onfi flash parsing in mtd.
> 
> And this is a one time operation of fairly small amount of
> data? I ask because you impl. is really slow.
Yes it checks only 253 bytes at startup time (one time only). So it is 
not speed critical.

> Why can't you use the crc16 LE version?
> 
Because it doesn't compute the crc provided by onfi spec. Or is there 
some magic maths to convert LE version to our version ?



Matthieu

[1]
        5.4.1.36. Byte 254-255: Integrity CRC
The Integrity CRC (Cyclic Redundancy Check) field is used to verify that 
the contents of the
parameters page were transferred correctly to the host. The CRC of the 
parameter page is a
word (16-bit) field. The CRC calculation covers all of data between byte 
0 and byte 253 of the
parameter page inclusive.
The CRC shall be calculated on word (16-bit) quantities starting with 
bytes 1:0 in the parameter
page. The bits in the 16-bit quantity are processed from the most 
significant bit (bit 15) to the
least significant bit (bit 0). Even bytes of the parameter page (i.e. 0, 
2, 4, etc) shall be used in the
lower byte of the CRC calculation (bits 7:0). Odd bytes of the parameter 
page (i.e. 1, 3, 5, etc)
shall be used in the upper byte of the CRC calculation (bits 15:8).
The CRC shall be calculated using the following 16-bit generator polynomial:
          G(X) = X16 + X15 + X2 + 1
This polynomial in hex may be represented as 8005h.
The CRC value shall be initialized with a value of 4F4Eh before the 
calculation begins. There is
no XOR applied to the final CRC value after it is calculated. There is 
no reversal of the data
bytes or the CRC calculated value.
[...]

A. SAMPLE CODE FOR CRC-16 (INFORMATIVE)
This section provides an informative implementation of the CRC-16 
polynomial. The example is intended as an aid in verifying an implementation
of the algorithm.
int main(int argc, char* argv[])
{
          // Bit by bit algorithm without augmented zero bytes
          const unsigned long crcinit = 0x4F4E;                 // 
Initial CRC value in the shift register
          const int order = 16;                                 // Order 
of the CRC-16
          const unsigned long polynom = 0x8005;                 // 
Polynomial
          unsigned long i, j, c, bit;
          unsigned long crc = crcinit;                          // 
Initialize the shift register with 0x4F4E
          unsigned long data_in;
          int dataByteCount = 0;
          crcmask = ((((unsigned long)1<<(order-1))-1)<<1)|1;
          crchighbit = (unsigned long)1<<(order-1);
          // Input byte stream, one byte at a time, bits processed from 
MSB to LSB
          printf("Input byte value in hex(eg. 0x30):");
          printf("\n");
   while(scanf("%x", &data_in) == 1)
   {
         c = (unsigned long)data_in;
         dataByteCount++;
         for (j=0x80; j; j>>=1) {
               bit = crc & crchighbit;
               crc<<= 1;
               if (c & j) bit^= crchighbit;
               if (bit) crc^= polynom;
         }
         crc&= crcmask;
         printf("CRC-16 value: 0x%x\n", crc);
   }
   printf("Final CRC-16 value: 0x%x, total data bytes: %d\n", crc, 
dataByteCount);
   return 0;
}
