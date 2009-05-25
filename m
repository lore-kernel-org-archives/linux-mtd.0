Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Zhc-00059E-A7
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 12:54:59 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <1243240685.21646.100.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
	<200905150916.54091.sr@denx.de>
	<C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1243240685.21646.100.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 15:54:42 +0300
Message-Id: <1243256082.21646.114.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Urs Muff <urs_muff@Trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 11:38 +0300, Artem Bityutskiy wrote:
> Presumably what happens it: UBIFS scans LEB 120. It checks the first
> node, and finds CRC mismatch. Then UBIFS logic is as follows. If this
> corrupted node is the last one, then there was a write interrupt,
> which is harmless. But if after this node some other data follows,
> this is some serious corruption. So the 'is_last_write()' function
> is called, it is supposed to check that.
> 
> In 'is_last_write()' I see it has different logic depending on whether
> c->min_io_size == 1 or not. The former case is NOR case, the latter
> is NAND. Well, since I know we never tested UBIFS well for NOR,
> I conclude the NOR case may have a bug.

Oh, this 'c->min_io_size == 1' case is just dead code, we never have
c->min_io_size < 8 in UBIFS. So I just remove that (patch at the end
of the e-mail).

Eric, please, reproduce this problem again. Then please, do not
"fix" it from u-boot. But instead, please do:

1. Enable UBIFS debugging
2. Enable recovery and mount messages, by booting with
   "ubifs.debug_msgs=6144" kernel parameter
3. also add the "ignore_loglevel" boot parameter
4. capture _all_ messages in minicom
5. If possible, make a full dump of your flash to play with it
   later.

Share the messages with us. I hope we can fix these problems.
Just provide us the info.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
