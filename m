Received: from [206.162.170.236] (helo=gateway.wavesat.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178MZS-0003eG-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 15:49:35 +0100
Message-ID: <009c01c1fce9$4415bf60$0200010a@WT0136>
From: "Ho-Kuo Chan" <hchan@wavesat.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <008101c1fce3$ae6588b0$0200010a@WT0136>  <006401c1fcde$bc00e8c0$0200010a@WT0136> <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> <9456.1021556252@redhat.com>  <14029.1021558521@redhat.com>
Subject: Re: Trouble indetifying FLASH part 
Date: Thu, 16 May 2002 10:52:14 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:
> Yes. That's what ioremap() does for you. But the map driver will already
be
> setting that up -- just call the map->copy_from function in the chip
probe,
> to read the first 0x40-odd bytes into a buffer, and then print them and
> compare with what you expected to see.

OK, this is what I did:
char buffer[0x40];

map->copy_from(map, (void*)buffer, 0, 0x40);

for (i = 0; i < 0x40; i++)
{
    printk("HKC: map->copy_from copied 0x%x to buffer\n", buffer[i];
}

The result was a continuous stream of 0xf0's. In VxWorks I get
0x1303434953463900 which is "..CIS59.". Does this tell you anything?

HK
