Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmgFB-0000si-PF
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 09:54:14 +0000
Message-ID: <1415354030.958.304.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/4] UBIFS: add xattr support for security / SELinux
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ben Shelton <ben.shelton@ni.com>
Date: Fri, 07 Nov 2014 11:53:50 +0200
In-Reply-To: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
References: <1414781431-2911-1-git-send-email-ben.shelton@ni.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-10-31 at 13:50 -0500, Ben Shelton wrote:
> I'm reposting the patch series for security xattr / SELinux support on UBIFS
> from Subodh Nijsure and Marc Kleine-Budde [1] in order to restart the process
> of getting this support upstream.
> 
> Notes:
> 
>  - I removed 'UBIFS: xattr: protect ui_size and data_len by ui_mutex' because
>    after looking through the comments before the definition of struct
>    ubifs_inode, I'm not sure what this was intended to fix.  It looks like
>    i_size and data_len are not intended to be protected by ui_mutex, and I'm
>    unclear on why ui->ui_size needs to be protected here by host_ui's ui_mutex.
>    CCing Marc -- could you comment on how this is supposed to work?

Thanks, I'll be looking at this as time allows. I think the MTD web site
mentioned somewhere that SELinux is not supported or something. In any
case, once we support SELinux, we need to tell on the web site that we
support it.

Which reminds me that I need to update the web-site and tell there that
I do not support the backport trees any longer...
