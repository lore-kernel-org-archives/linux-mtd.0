Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxhG9-0001AS-Qg
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 19:45:02 +0000
Received: by pdea3 with SMTP id a3so24012681pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 12:44:38 -0700 (PDT)
Date: Wed, 27 May 2015 12:44:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Denys Vlasenko <dvlasenk@redhat.com>
Subject: Re: [PATCH] mtd: cfi: Deiline large functions
Message-ID: <20150527194348.GI27753@ld-irv-0074>
References: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431946720-32281-1-git-send-email-dvlasenk@redhat.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Aaron Sierra <asierra@xes-inc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 18, 2015 at 12:58:40PM +0200, Denys Vlasenko wrote:
> With this .config: http://busybox.net/~vda/kernel_config,
> after uninlining these functions have sizes and callsite counts
> as follows:
> 
> cfi_udelay(): 74 bytes, 26 callsites
> cfi_send_gen_cmd(): 153 bytes, 95 callsites
> cfi_build_cmd(): 274 bytes, 123 callsites
> cfi_build_cmd_addr(): 49 bytes, 15 callsites
> cfi_merge_status(): 230 bytes, 3 callsites
> 
> Reduction in code size is about 50,000:
> 
>     text     data      bss       dec     hex filename
> 85842882 22294584 20627456 128764922 7accbfa vmlinux.before
> 85789648 22294616 20627456 128711720 7abfc28 vmlinux
> 
> Signed-off-by: Denys Vlasenko <dvlasenk@redhat.com>
> CC: Dan Carpenter <dan.carpenter@oracle.com>
> CC: Jingoo Han <jg1.han@samsung.com>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: Aaron Sierra <asierra@xes-inc.com>
> CC: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> CC: David Woodhouse <David.Woodhouse@intel.com>
> CC: linux-mtd@lists.infradead.org
> CC: linux-kernel@vger.kernel.org

Fixed the subject and applied to l2-mtd.git.

For my reference, did you test this, or just compile test?

Brian
