Received: from mail.smsc.com ([170.129.50.11] helo=smsc.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KxdkU-0000Z0-Q0
	for linux-mtd@lists.infradead.org; Wed, 05 Nov 2008 08:28:23 +0000
In-Reply-To: <fe810cf0810270229n6a8dce43p404cdaa27283d13b@mail.gmail.com>
To: "Alexander Belyakov" <abelyako@googlemail.com>
Subject: Re: [PATCH] [JFFS2] Fix build failure with
	!CONFIG_JFFS2_FS_WRITEBUFFER
MIME-Version: 1.0
From: Steve.Glendinning@smsc.com
Message-ID: <OFF4E6CCB3.C9228FE2-ON802574F8.002E1703-802574F8.002E7CB9@smsc.com>
Date: Wed, 5 Nov 2008 08:27:13 +0000
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
	ian.saturley@smsc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alexander,

This build failure still exists in linus's tree (2.6.28-rc3).  Can you 
please push this fix upstream, as it's a build regression for many 
embedded platforms?

Regards,
--
Steve Glendinning
SMSC GmbH
m: +44 777 933 9124
e: steve.glendinning@smsc.com



"Alexander Belyakov" <abelyako@googlemail.com> wrote on 27/10/2008 
09:29:34:

> On Tue, Oct 21, 2008 at 3:25 PM, Steve Glendinning
> <steve.glendinning@smsc.com> wrote:
> > Build failure introduced by 5bf1723723487ddb0b9c9641b6559da96b27cc93
> > [JFFS2] Write buffer offset adjustment for NOR-ECC (Sibley) flash
> >
> > Signed-off-by: Steve Glendinning <steve.glendinning@smsc.com>
> 
> Steve,
> 
> Thank you for finding this.
> 
> Alexander
