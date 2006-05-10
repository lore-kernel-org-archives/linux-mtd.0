Received: from smtpauth08.mail.atl.earthlink.net ([209.86.89.68])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdu7E-0005Gm-1R
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 15:12:59 -0400
Received: from [209.86.224.39] (helo=elwamui-little.atl.sa.earthlink.net)
	by smtpauth08.mail.atl.earthlink.net with asmtp (Exim 4.34)
	id 1Fdu79-00054o-BD
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 15:12:51 -0400
Message-ID: <16539078.1147288371389.JavaMail.root@elwamui-little.atl.sa.earthlink.net>
Date: Wed, 10 May 2006 12:12:50 -0700 (GMT-07:00)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: NAND read errors, R/O FS
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>On Wed, 10 May 2006 15:20:44 +0400, Vitaly Wool wrote:
>> Josh Boyer wrote:
>>
>> >Not quite the case.  You need bad block skipping, yes.  But NAND can
>> >get bit flips in good blocks still.  How do you deal with that?  You
>> >can't leave the block in that state forever because it will continue
>> >to get bit flips and then your data will be unusable.
>> Yep, I know about the issue. The recommended way to go here AFAIK is to 
>> mark the block as bad and copy its contents to a free one.

FWIW, on the Samsung K9F* NAND chip, the explicitly recommended procedure
for single bit read errors is to do single bit Error Correction (assuming ECC 
is implemented) and to NOT remap (you _are_ supposed to  remap and
copy one write errors). Apparently the chances of a 2nd bit error within a single
512 byte page (the ECC unit) are negligible.

sf
