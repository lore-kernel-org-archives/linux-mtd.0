Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Gpby-00044s-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 23:59:27 +0000
Message-ID: <3DE411F1.7F78DBA2@cs.fujitsu.co.jp>
Date: Wed, 27 Nov 2002 09:29:37 +0900
From: Takeharu KATO <tkato@cs.fujitsu.co.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Linux-2.4.18 block MTD dead-lock
References: <3DE37160.A152A2F5@cs.fujitsu.co.jp> <1436.1038316893@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
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

Dear Woodhouse:

David Woodhouse wrote:
> 
> tkato@cs.fujitsu.co.jp said:
> > 3. The solution
> > We changed the sequence of the function called ``get_sb_bdev''
> >  in fs/super.c.  We changed the function to make the block device  to
> > be mounted checked before opening the device.
> >  Please refer the patch to make out the changes in detail.
> 
> Wrong fix. Use the fix which is already in 2.4.19.
> 
Thank you for your response.
I'll try it later.

Yours, Sincerely.
-- 
Takeharu KATO
Fujitsu Limited
Email:tkato@cs.fujitsu.co.jp (ext. 7112-4621)
