Received: from hex.linuxgrrls.org
	([212.18.228.73] helo=mail.linuxgrrls.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nHJB-0003mS-0G
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 13:34:25 +0100
Message-ID: <50684.192.91.75.30.1060864451.squirrel@mail.linuxgrrls.org>
In-Reply-To: <1060863668.3152.72.camel@passion.cambridge.redhat.com>
References: <3F3B75AA.6050701@elsoft.ch>
    <1060861648.3152.70.camel@passion.cambridge.redhat.com>
    <3F3B7D66.5030907@elsoft.ch>
    <1060863668.3152.72.camel@passion.cambridge.redhat.com>
Date: Thu, 14 Aug 2003 13:34:11 +0100 (BST)
From: jasmine@linuxgrrls.org
To: "David Woodhouse" <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "\"David =?iso-8859-1?Q?M=FCller?=" <d.mueller@elsoft.ch>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 internals question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


David wrote:

> I think we do make read calls which cross a page boundary, yes.

And the inability to handle such calls was the reason that the
old DiskOnChip driver didn't work with jffs2, as I recall.

-Jasmine.
