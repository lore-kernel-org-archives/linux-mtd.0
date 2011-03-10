Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pxfpg-0005f6-8E
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 13:23:12 +0000
Received: by eyh6 with SMTP id 6so548274eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 05:23:09 -0800 (PST)
Subject: Re: [PATCH] check kmalloc return value in mtd/sm_rtl.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xiaochen Wang <wangxiaochen0@gmail.com>
In-Reply-To: <20110310054230.GA6022@chii>
References: <20110310054230.GA6022@chii>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Mar 2011 15:21:38 +0200
Message-ID: <1299763298.6676.12.camel@localhost>
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

Hi,

On Thu, 2011-03-10 at 13:42 +0800, Xiaochen Wang wrote: 
> @@ -83,12 +87,24 @@ struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
>  	/* Create array of pointers to the attributes */
>  	attributes = kzalloc(sizeof(struct attribute *) * (NUM_ATTRIBUTES + 1),
>  								GFP_KERNEL);
> +	if (!attributes)
> +		got error3;

Please, compile-check patches before sending them out :-)


Best Regards,
Artem Bityutskiy (Артём Битюцкий)
