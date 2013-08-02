Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5Hap-0006bZ-OJ
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:48:40 +0000
Message-ID: <1375458812.14869.350.camel@sauron.fi.intel.com>
Subject: Re: [RESEND][PATCH] mtd: refactor call to request_module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kees Cook <keescook@chromium.org>
Date: Fri, 02 Aug 2013 18:53:32 +0300
In-Reply-To: <20130708130512.GA24315@www.outflux.net>
References: <20130708130512.GA24315@www.outflux.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: James Hogan <james.hogan@imgtec.com>, Rusty Russell <rusty@rustcorp.com.au>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-07-08 at 06:05 -0700, Kees Cook wrote:
> This reduces the size of the stack frame when calling request_module().
> Performing the sprintf before the call is not needed.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
