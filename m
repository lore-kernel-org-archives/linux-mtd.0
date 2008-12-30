Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHZdo-00036L-0P
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 08:07:52 +0000
Message-ID: <4959D96D.3010105@nokia.com>
Date: Tue, 30 Dec 2008 10:18:53 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Ashish Pareek <ashish.pareek@drishyasystems.com>
Subject: Re: MTD Limitations
References: <B7FB0517CFA8454BAB8C36E3A1ABABF2@drishyanb2>
	<495882DE.3090708@nokia.com>
	<3A55DF4F429D4A54BD827D81546E0FE3@drishyanb2>
In-Reply-To: <3A55DF4F429D4A54BD827D81546E0FE3@drishyanb2>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ashish Pareek wrote:
> Hi  Adrian,
> Currently we are using DM355 based Custom board , that will be having 
> another 4k page Nand from Micron (MT29F64G08TAAWP)in parallel with 
> exisitng 2k pg Nand (MT29F16G08FAAWC) . we have 4 diff chip select (2 
> per chip )determined by the CS0 along with 2 address lines using a 
> decoding logic .
> 
> I dont think any support for 4k pg NF is available . How could be the 
> design possible ?

You will have to make the changes to support 4k pg NF yourself.  I do not
have such a device, so I do not know exactly what the requirements are.

> 
> Ashish
> ----- Original Message ----- From: "Adrian Hunter" 
> <ext-adrian.hunter@nokia.com>
> To: "Ashish Pareek" <ashish.pareek@drishyasystems.com>
> Cc: "linux-mtd Mailing List" <linux-mtd@lists.infradead.org>
> Sent: Monday, December 29, 2008 1:27 PM
> Subject: Re: MTD Limitations
> 
> 
>> Ashish Pareek wrote:
>>> Does MTD has Limitations to support Nand Flash <=4GB ? Has this issue 
>>> is fixed in latest MTD GIT ?
>>
>> The latest MTD GIT does support 4GB NAND flash, however you will
>> need to check your particular driver does not have limitations.
>>
>> Please be aware that the ioctls used by mtd-utils are limited to
>> 32-bit sizes.  That means they do *not* support 4GiB, but they are
>> probably OK for less than 4GiB i.e. 4GiB minus one eraseblock size.
>>
> 
