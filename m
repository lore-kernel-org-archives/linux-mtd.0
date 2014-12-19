Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1n9b-0000wl-L7
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 02:18:56 +0000
Message-ID: <54938ACF.3020904@huawei.com>
Date: Fri, 19 Dec 2014 10:17:51 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
Subject: Re: do_sys_name_to_handle on UBIFS
References: <8EE5FC3D-A32C-4D02-B5AB-0A6E549F3E43@axis.com>
In-Reply-To: <8EE5FC3D-A32C-4D02-B5AB-0A6E549F3E43@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/12/17 20:39, Umut Tezduyar Lindskog wrote:
> Hi,
> 
> I have noticed that name_to_handle() system call is failing on UBIFS due to missing super_block.s_export_op. Is there a reason why this hasn’t been implemented on UBI?
> 

As I know, this *struct export_operations* is used for nfsd. But
NFS is not supported with UBIFS. So I guess this is the reason
why super_block.s_export_op is missing.

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_nfs
