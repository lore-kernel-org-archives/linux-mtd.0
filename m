Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy7Ki-0007Xn-93
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 23:35:29 +0000
Received: by pdbqa5 with SMTP id qa5so52374199pdb.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 16:35:06 -0700 (PDT)
Date: Thu, 28 May 2015 16:34:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Bernhard Walle <bernhard@bwalle.de>
Subject: Re: [PATCH] mkfs.ubifs: Fix build with gcc 5.1
Message-ID: <20150528233456.GA17945@ld-irv-0074>
References: <1430570286-30434-1-git-send-email-bernhard@bwalle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430570286-30434-1-git-send-email-bernhard@bwalle.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 02, 2015 at 02:38:06PM +0200, Bernhard Walle wrote:
> In gcc 5.1, the default C standard which is used to compile a C file,
> has changed from gnu89 to gnu11. This changed the meaning of 'extern
> inline'. See https://gcc.gnu.org/gcc-5/porting_to.html.
> 
> In mkfs.ubifs, this leads to multiple definitions of
> hashtable_iterator_key and -hashtable_iterator_value. I think the most
> pragmatic way to fix the issue is to replace 'extern inline' with
> 'static inline' here.
> 
> Signed-off-by: Bernhard Walle <bernhard@bwalle.de>

Pushed to mtd-utils.git. Thanks.
