Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJsiS-0002qa-SQ
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 08:03:50 -0400
Message-ID: <4175035B.80101@inf.u-szeged.hu>
Date: Tue, 19 Oct 2004 14:06:51 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <417156E1.9000009@yandex.ru> <4173AFAE.6060303@inf.u-szeged.hu>
	<4173B404.6040100@yandex.ru> <4174C8EF.50604@inf.u-szeged.hu>
	<4174D508.8050508@yandex.ru> <4174E7D3.9050706@inf.u-szeged.hu>
	<4174F0F3.7030604@yandex.ru>
In-Reply-To: <4174F0F3.7030604@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> It isn't needed to store the default compression mode *on flash*. If you 
> just move the variable jffs2_compression mode to the jffs2_sb_info 
> structure, you will have per-filesystems compression mode. This means, 
> for example, that if user changes (dynamically) the compression mode for 
> one file-system, the compression mode for another file system isn't 
> changed.

I undersand you, but unfortunatelly now there is no way to change 
compression mode dimamically. There was (using procfs) but when David 
tried to commit it to the kernel, someone (I don't remember who but one 
of the kernel developers) declared it bad.

David asked me to reimplement it is sysfs, but that is not an easy 
thing. Not technically. There is no fs subdirectory in sysfs. I read in 
the mailling list archive of linux-fsdevel@vger.kernel.org. Someone 
tried to submit a patch to make this fs subdirectory, because he need it 
for NFS. The answer declared it as very bad, too... (sysfs has a 
different philosopy...) I had some private discussion with the patch 
submitter (what happened exactly, what was really the problem,... what 
is his plan). He wrote that he try it again later. He think the guy who 
declared his patch bad really hates sysfs (and procfs too). So I decided 
to wait, too. :(

But this new "compressoin configuration" concept may cause that we don't 
need sysfs/procfs.

Bye,
Ferenc
