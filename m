Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19O2Ht-0001Zm-Gs
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 22:28:45 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: <Srinivasu.Vaduguri@nokia.com>, <linux-mtd@lists.infradead.org>
Date: Fri, 6 Jun 2003 09:31:56 +1200
References: <AEB09EDA2548094C81ED6AA93269F63D01D0925F@siebe001.apac.nokia.com>
In-Reply-To: <AEB09EDA2548094C81ED6AA93269F63D01D0925F@siebe001.apac.nokia.com>
MIME-Version: 1.0
Message-Id: <20030605212919.C1C321519A@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: NAND Chips - "Erase success and failed writes !!!"
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 05 June 2003 23:00, Srinivasu.Vaduguri@nokia.com wrote:
> Hi all,
>
> I am facing a strange problem in some of our devices which uses Samsung
> 64MB NAND chips.. The blocks didnt report any bad blocks initially. But
> after some days one of the block Erase is succesfull but reports  "Failed
> write" after programming the page..
>
> And in some devices I found "Erase fails" and write successful.. But in
> this case "Write-verify" fails..

Yup, to be expected.

With NOR flash, a write fails if the programmed pattern does not match the 
read-back pattern.
With NAND flash a write fails if any 0s in the programmed pattern read back 
as 1s.

Thus, if the erase failed (could not turn some 0s into 1s), then the 
following could happen:

* Pattern on NAND after failed erase:   1101
* Write pattern 1011 to NAND:             1001 -> write passes
* Verify (compare 1011 with NAND 1001) fails.


>
> Anybody faced this problem before.. or has any clues..

This is far more complex than is easily explained through an email list.

It sounds to me like you are not using a file system (YAFFS or JFFS2) which I 
would expect would have automatically addressed these problems.

-- CHarles
