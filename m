Received: from mail.pce.us.com ([69.40.160.195])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TftkR-0005w7-Ce
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 14:45:23 +0000
Message-ID: <50BE0C7E.6000001@itwatchdogs.com>
Date: Tue, 4 Dec 2012 08:45:18 -0600
From: Zach Sadecki <zsadecki@itwatchdogs.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI Fastmap fixes for 3.7
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
In-Reply-To: <1354564667-9549-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/03/2012 01:57 PM, Richard Weinberger wrote:
> This patch series contains two brown-paper-bag-bugfixes.
> I'm very sorry for them!
>
> [PATCH 1/2] ubi: Remove PEB from free tree in get_peb_for_wl()
> This one fixes a very odd issue with fastmap disabled.
> With fastmap disabled get_peb_for_wl() did not remove PEBs from
> the free list. Therefore the free, used and scrub trees got corrupted.
>
> [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in __wl_get_peb()
> The issue fixed by that patch is also very nasty. I missed that
> ubi_self_check_all_ff() can sleep. So, we cannot call it from
> __wl_get_peb().
>
> Thanks,
> //richard
Thanks, guys.  An overnight test run has shown that these patches have 
fixed the UBI problems on my board.  Something else odd is happening, 
but that's for another thread...
