Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MdeE9-0003ng-Ez
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 06:00:58 +0000
Subject: [Fwd: Re: about ubifs question]
From: tommy <jiujin.hong@mid-fun.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-Nhxw+vZ0E8JGEt44stcH"
Date: Wed, 19 Aug 2009 14:00:46 +0800
Message-Id: <1250661646.13317.2.camel@tommy-desktop>
Mime-Version: 1.0
Cc: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Nhxw+vZ0E8JGEt44stcH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-Nhxw+vZ0E8JGEt44stcH
Content-Disposition: inline
Content-Description: Forwarded message - Re: about ubifs question
Content-Type: message/rfc822

Subject: Re: about ubifs question
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1250661066.3885.6.camel@localhost>
References: <1250656786.11476.2.camel@tommy-desktop>
	 <1250658794.3885.1.camel@localhost>
	 <1250660141.11476.4.camel@tommy-desktop>
	 <1250661066.3885.6.camel@localhost>
Content-Type: text/plain; charset=utf-8
Message-Id: <1250661529.13317.1.camel@tommy-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Date: Wed, 19 Aug 2009 13:58:49 +0800
Content-Transfer-Encoding: 8bit


thanks,sir!
when i resume ,i try :

root@localhost:/# rm -rf 1.txt 
UBIFS error (pid 1289): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
rm: cannot remove '1.txt': Read-only file system




root@localhost:/# touch 2.txt
UBIFS error (pid 1292): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 1292): ubifs_create: cannot create regular file, error
-30
touch: 2.txt: Read-only file system


On 三, 2009-08-19 at 08:51 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-08-19 at 13:35 +0800, tommy wrote:
> > Halt --->Power on 
> 
> Then please, find the answers here:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback
> 
> and also take a look here, please:
> http://www.infradead.org/~dwmw2/email.html
> 

--=-Nhxw+vZ0E8JGEt44stcH--
