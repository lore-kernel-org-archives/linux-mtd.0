Received: from rwcrmhc13.comcast.net ([204.127.198.39])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DnJ9B-0008MX-Fb
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 12:41:19 -0400
From: Charles Tilbury <charles.tilbury@comcast.net>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Date: Tue, 28 Jun 2005 09:41:14 -0700
References: <200506271409.42449.charles.tilbury@comcast.net>
	<200506280858.14732.charles.tilbury@comcast.net>
	<42C17594.4000403@yandex.ru>
In-Reply-To: <42C17594.4000403@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200506280941.14702.charles.tilbury@comcast.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash question
Reply-To: charles.tilbury@comcast.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 28 June 2005 9:06 am, Artem B. Bityuckiy wrote:
> Charles Tilbury wrote:
> > Yes. Thanks.  Now, I am looking for a way to get the file systems
> > unmounted upon loss of power.
>
> I assume you don't look for this in order to get rid of these messages ?

(sorry about the prev. top-post)

In part, I want to get rid of the messages.  They make the marketing guys 
nervous.  <<grin>>  I may just supress them using comments.  What I really 
need is to make sure that the user land data gets flushed to NAND before 
power loss.   That seems like a JFFS2 issue, do you agree?

-=CharlesT=-
