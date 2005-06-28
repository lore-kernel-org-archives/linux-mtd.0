From: David Woodhouse <dwmw2@infradead.org>
To: charles.tilbury@comcast.net
In-Reply-To: <200506280941.14702.charles.tilbury@comcast.net>
References: <200506271409.42449.charles.tilbury@comcast.net>
	<200506280858.14732.charles.tilbury@comcast.net>
	<42C17594.4000403@yandex.ru>
	<200506280941.14702.charles.tilbury@comcast.net>
Content-Type: text/plain
Date: Tue, 28 Jun 2005 19:30:59 +0100
Message-Id: <1119983460.12240.22.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: NAND flash question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-06-28 at 09:41 -0700, Charles Tilbury wrote:
> In part, I want to get rid of the messages.  They make the marketing
> guys nervous.  <<grin>>  I may just supress them using comments.  What
> I really need is to make sure that the user land data gets flushed to
> NAND before power loss.   That seems like a JFFS2 issue, do you agree?

Not really. Userland data are flushed to the medium on fsync() or sync()
just as with other file systems. If a write() call has _just finished
when the power is lost, there's no guarantee that _any_ file system will
have committed that write to the medium already. (Unless you were using
O_SYNC, which we don't support for JFFS2).

-- 
dwmw2
