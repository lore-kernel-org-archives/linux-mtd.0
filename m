Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ViOS-00036J-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2002 00:14:28 +0000
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GQQ006016HUAP@asu.edu> for linux-mtd@lists.infradead.org; Tue,
 29 Jan 2002 17:25:06 -0700 (MST)
Date: Tue, 29 Jan 2002 17:25:26 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Problems with mounting a JFFS2 file system image
In-reply-to: <D3A72C5007329A4F991C0DD87202259F096A41@sekhmet.ad.newisys.com>
To: Navin Boppuri <navin.boppuri@newisys.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <1012350327.3308.2.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <D3A72C5007329A4F991C0DD87202259F096A41@sekhmet.ad.newisys.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 2002-01-29 at 17:09, Navin Boppuri wrote:
> Hello all,
> 
> I have been able to succesfully partition my flash and mount a jffs2 file system on the same. I am able to copy, create, read and write files onto my new file system. 
> 
> Now, I wanted to create a file system on my host machine using the mkfs.jffs2 utility and mount the file system onto my flash partition on my embedded device. But I havent been successful in doing so. I followed the JFFS2 README and this is what I did:
> 
> 	mkfs.jffs -d tmp_fs -o jffs2.image   ( tmp_fs is a directory with all my files in it)
us mkfs.jffs2, it may also be neccessary to supply your erase block size
 
