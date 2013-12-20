Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VttEt-00054X-44
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 06:07:11 +0000
Message-ID: <52B3DDC8.9090201@openwrt.org>
Date: Fri, 20 Dec 2013 07:03:52 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 3/8] mtd: lantiq-flash: Use devm_kzalloc()
References: <000f01cefd3f$60ef8540$22ce8fc0$%han@samsung.com>
 <001201cefd40$2db34260$8919c720$%han@samsung.com>
In-Reply-To: <001201cefd40$2db34260$8919c720$%han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'Brian Norris' <computersforpeace@gmail.com>,
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

On 20/12/13 05:58, Jingoo Han wrote:
>   err_destroy:
>   	map_destroy(ltq_mtd->mtd);
>   err_free:
> -	kfree(ltq_mtd->map);
>   err_out:
> -	kfree(ltq_mtd);
>   	return err;
>   }

Hi,

after the cleanup only err_destroy is needed. the other 2 jump marks can 
be removed aswell.

     John
