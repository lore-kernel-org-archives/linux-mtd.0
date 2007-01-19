Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H7oja-0004ym-CF
	for linux-mtd@lists.infradead.org; Fri, 19 Jan 2007 03:04:29 -0500
Message-ID: <45B07B22.2000207@nokia.com>
Date: Fri, 19 Jan 2007 10:02:42 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: Always print error messages
References: <28919711.82641169190892414.JavaMail.weblogic@ep_ml26>
In-Reply-To: <28919711.82641169190892414.JavaMail.weblogic@ep_ml26>
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
>> Is it possible to get an ECC error when scanning a bad block?
> 
> Theoretical it's possible but I never see it.

I like to program all the corner cases.

>> If a load error occurs when scanning a bad block, does that mean the dataRAM
>> has been updated or not?
> 
> scanning a bad block means read oob so we don't update dataRAM. In onenand implementation. we always invalid dataRAM in oob case.

I meant the dataRAM spare area: 8010h - 804fh in the bufferRAM address map.

After a load error, will this:

		this->read_bufferram(mtd, ONENAND_SPARERAM, buf, column, thislen);

read the what was meant to be loaded, or will it still contain the data from a previous load?
