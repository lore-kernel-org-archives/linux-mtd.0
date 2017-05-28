Received: from mailsec108.isp.belgacom.be ([195.238.20.104])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEwsF-00044Z-T9
 for linux-mtd@lists.infradead.org; Sun, 28 May 2017 12:00:46 +0000
Date: Sun, 28 May 2017 14:00:18 +0200 (CEST)
From: Fabian Frederick <fabf@skynet.be>
Reply-To: Fabian Frederick <fabf@skynet.be>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-mtd@lists.infradead.org, pvfs2-developers@beowulf-underground.org,
 ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jfs-discussion@lists.sourceforge.net
Message-ID: <958803264.435844.1495972818238.open-xchange@webmail.nmp.proximus.be>
In-Reply-To: <20170528093401.GD14519@infradead.org>
References: <20170521153947.26281-1-fabf@skynet.be>
 <20170528093401.GD14519@infradead.org>
Subject: Re: [PATCH 00/11 linux-next] super magic values consolidation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> On 28 May 2017 at 11:34 Christoph Hellwig <hch@infradead.org> wrote:
>
>
> On Sun, May 21, 2017 at 05:39:47PM +0200, Fabian Frederick wrote:
> > This small patchset reorganizes magic.h and fixes filesystems
> > which defined locally super magic values.
>
> And what's the point?

Current magic.h organization is strange for the less. Filesystems generally use
SUPER_MAGIC values from magic.h
instead of a local definition plus it looks easier for new subsystems to look at
just one file when
seeking for unique value.
