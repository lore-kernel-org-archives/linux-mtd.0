Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtuIr-0000cB-Ko
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:15:23 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300A8FG4SZ1D0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 16:14:52 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'John Crispin' <blogic@openwrt.org>
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
 <001201cefd40$2db34260$8919c720$%han@samsung.com>
 <52B3DDC8.9090201@openwrt.org>
In-reply-to: <52B3DDC8.9090201@openwrt.org>
Subject: Re: [PATCH 3/8] mtd: lantiq-flash: Use devm_kzalloc()
Date: Fri, 20 Dec 2013 16:14:51 +0900
Message-id: <000601cefd53$2cfdda70$86f98f50$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>, linux-mtd@lists.infradead.org,
 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Thomas Langer' <thomas.langer@lantiq.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, December 20, 2013 3:04 PM, John Crispin wrote:
> On 20/12/13 05:58, Jingoo Han wrote:
> >   err_destroy:
> >   	map_destroy(ltq_mtd->mtd);
> >   err_free:
> > -	kfree(ltq_mtd->map);
> >   err_out:
> > -	kfree(ltq_mtd);
> >   	return err;
> >   }
> 
> Hi,
> 
> after the cleanup only err_destroy is needed. the other 2 jump marks can
> be removed aswell.

Hi John Crispin,

I see. You're right.
I will remove unnecessary goto labels such as err_free, err_out.
Thank you for your comment. :-)

Best regards,
Jingoo Han
