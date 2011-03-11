Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pxxyd-0005CI-UQ
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2011 08:45:40 +0000
Received: by wwc33 with SMTP id 33so2018927wwc.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Mar 2011 00:45:37 -0800 (PST)
Subject: Re: [PATCH] check kmalloc return value in mtd/sm_rtl.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xiaochen Wang <wangxiaochen0@gmail.com>
In-Reply-To: <20110310143139.GA15778@chii>
References: <20110310054230.GA6022@chii>
	<1299763298.6676.12.camel@localhost>  <20110310143139.GA15778@chii>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Mar 2011 10:44:05 +0200
Message-ID: <1299833045.2732.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-03-10 at 22:31 +0800, Xiaochen Wang wrote:
> Hi, Artem
> > > +	if (!attributes)
> > > +		got error3;
> I'm so sorry for that:(
> > Please, compile-check patches before sending them out :-)
> Thanks for your advice, I'll do it.
> 
> The new patch , which has been compile-checked, is here:
> 
> Description:
> Because malloc/kzalloc may fail, we should check kmalloc/kzalloc return value 
>  in sm_create_sysfs_attributes(), mtd/sm_rtl.c and do error handling.
> Meanwhile, we should check sm_create_sysfs_attributes return value.
> 
> Signed-off-by: Xiaochen Wang <wangxiaochen0@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
