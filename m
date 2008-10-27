Received: from el-out-1112.google.com ([209.85.162.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KuOPn-0000lZ-Ly
	for linux-mtd@lists.infradead.org; Mon, 27 Oct 2008 09:29:35 +0000
Received: by el-out-1112.google.com with SMTP id y26so1066598ele.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Oct 2008 02:29:35 -0700 (PDT)
Message-ID: <fe810cf0810270229n6a8dce43p404cdaa27283d13b@mail.gmail.com>
Date: Mon, 27 Oct 2008 12:29:34 +0300
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "Steve Glendinning" <steve.glendinning@smsc.com>
Subject: Re: [PATCH] [JFFS2] Fix build failure with
	!CONFIG_JFFS2_FS_WRITEBUFFER
In-Reply-To: <1224591951-30369-1-git-send-email-steve.glendinning@smsc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1224591951-30369-1-git-send-email-steve.glendinning@smsc.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
	Ian Saturley <ian.saturley@smsc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2008 at 3:25 PM, Steve Glendinning
<steve.glendinning@smsc.com> wrote:
> Build failure introduced by 5bf1723723487ddb0b9c9641b6559da96b27cc93
> [JFFS2] Write buffer offset adjustment for NOR-ECC (Sibley) flash
>
> Signed-off-by: Steve Glendinning <steve.glendinning@smsc.com>

Steve,

Thank you for finding this.

Alexander
