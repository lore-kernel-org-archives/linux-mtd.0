Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7pc5-00064A-0d
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 04:00:47 -0500
Message-ID: <45B08840.6050507@nokia.com>
Date: Fri, 19 Jan 2007 10:58:40 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: Always print error messages
References: <7109995.92931169194871882.JavaMail.weblogic@ep_ml26>
In-Reply-To: <7109995.92931169194871882.JavaMail.weblogic@ep_ml26>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
>>>> If a load error occurs when scanning a bad block, does that mean the dataRAM
>>>> has been updated or not?
>>> scanning a bad block means read oob so we don't update dataRAM. In onenand implementation. we always invalid dataRAM in oob case.
>> 
>> I meant the dataRAM spare area: 8010h - 804fh in the bufferRAM address map.
>> 
>> After a load error, will this:
>> 
>> 		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);
>> 
>> read the what was meant to be loaded, or will it still contain the data from a previous load?
> 
> => It depends on load error timings. but we think it is always invalid.
> load error means that there's error during load from nand core to bufferram.

So, when scanning for bad blocks, after a load error or ECC (2 bit) error, we have to
assume that the block is bad without reading the spare area?

In that case, should we attempt to mark the block as bad,
perhaps writing the spare area in the second page?
