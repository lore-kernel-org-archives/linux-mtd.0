Received: from fmr18.intel.com ([134.134.136.17] helo=orsfmr003.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EUDMb-0004el-0L
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2005 02:12:31 +0100
From: "zhao, forrest" <forrest.zhao@intel.com>
To: zhao forrest <zhao_fusheng@hotmail.com>
In-Reply-To: <BAY17-F15DEB2FFF5F102120DB7A6E8860@phx.gbl>
References: <BAY17-F15DEB2FFF5F102120DB7A6E8860@phx.gbl>
Content-Type: text/plain
Date: Tue, 25 Oct 2005 09:07:12 +0800
Message-Id: <1130202432.3611.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-10-09 at 14:53 +0800, zhao forrest wrote:
> Hi,
> 
> Being compared with version 4, the main changes are:
> 1 remove data_crc field from struct jffs2_raw_ebh
> 2 change the macro names for EBH in flags
> 3 rollback to stack allocation of ebh
> 4 encapsulate the complidated condition judgement into
> small functions. has_expected_free_size() and 
> need_mark_first_node_obsolete().
> 
> The revised patch is at:
> http://www.infradead.org/~forrest/eraseblock_header_r5.patch
> 
> Thanks,
> Forrest

Is there any further review comment on this?
