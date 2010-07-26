Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdFmT-0008DD-K7
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 04:59:15 +0000
Subject: Re: Mounting JFFS2 partitions as read-only and CRC failures
From: Artem Bityutskiy <dedekind1@gmail.com>
To: j ram <buggyballs@gmail.com>
In-Reply-To: <AANLkTilV0_Ya6fSC4m7jX2kMqnNMDD8-RcampJxxwcDU@mail.gmail.com>
References: <AANLkTilV0_Ya6fSC4m7jX2kMqnNMDD8-RcampJxxwcDU@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 07:58:29 +0300
Message-ID: <1280120309.14917.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-22 at 11:14 -0700, j ram wrote:
> Hi,
> I have a question.
> I've encountered JFFS2 CRC errors on the lines of
> Name CRC failed on node at 0x00b620c8: Read 0x640c8ca3, calculated 0x795111fe
> 
> According to http://www.linux-mtd.infradead.org/faq/jffs2.html#L_messages,
> JFFS2 CRC failure messages could mean node corruption caused by media
> corruption or unclean reboots.
> 
> If the JFFS2 partition is mounted as read-only, is it safe to conclude
> that node corruption is unlikely?
> 
> Appreciate any insight

Read disturbs can lead to bit-flips which can develop into hard errors.
On SLC this is difficult do achieve but possible, although it may
require millions of reads, on MLC this is achievable more easily.

So the answer is - not, you cannot conclude that.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
