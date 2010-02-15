Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh1qG-0001Ay-Bz
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 14:22:32 +0000
Subject: Re: noatime and nodiratime for ubifs mounting
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea61002150610w1d2eb87dh406a54cfa57ebba7@mail.gmail.com>
References: <dbdb2ea61002090633h770779a5gfa640a3fd6112c22@mail.gmail.com>
	<1265726904.2006.157.camel@localhost>
	<dbdb2ea61002090702y41bfa719k73c4b2c5125d3be3@mail.gmail.com>
	<dbdb2ea61002150610w1d2eb87dh406a54cfa57ebba7@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 15 Feb 2010 16:21:23 +0200
Message-ID: <1266243683.11659.106.camel@localhost>
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

On Mon, 2010-02-15 at 09:10 -0500, twebb wrote:
> >>> To minimize unnecessary writes to UBIFS, does it make sense to mount
> >>> with the noatime and nodiratime flags?  Some information I've read
> >>> suggests that this helps minimize writes and is beneficial to
> >>> flash-based filesystems.  Is there any downside to using these flags?
> >>
> >> UBIFS does not support atime anyway:
> >>
> >> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atime
> >>
> >
> > Thanks.  Sorry, I hadn't seen that specific question.
> >
> > Does that mean UBIFS also doesn't support 'diratime'?
> >
> 
> Sorry to ask again, but does no "atime" support mean no "diratime"
> either for UBIFS?

Yes, obviously.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
