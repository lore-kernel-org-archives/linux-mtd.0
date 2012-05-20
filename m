Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SVz1L-00037V-J0
 for linux-mtd@lists.infradead.org; Sun, 20 May 2012 05:49:36 +0000
Received: by wgbds1 with SMTP id ds1so2841848wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 19 May 2012 22:49:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1337340757-26127-1-git-send-email-dedekind1@gmail.com>
References: <1337245412-22222-1-git-send-email-seed95@gmail.com>
 <1337340757-26127-1-git-send-email-dedekind1@gmail.com>
From: Sidney Amani <seed95@gmail.com>
Date: Sun, 20 May 2012 15:49:12 +1000
Message-ID: <CA+NVJM-722Pg-ZfRpzOFSm-rdAKDgptcoP8Sa1wq95BtUpJwdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] UBIFS: make ubifs_lpt_init clean-up in case of failure
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 18, 2012 at 9:32 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> Most functions in UBIFS follow the following designn pattern: if the function
> allocates multiple resources, and failss at some point, it frees what it has
> allocated and returns an error. So the caller can rely on the fact that the
> callee has cleaned up everything after own failure.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Acked-by: Sidney Amani <seed95@gmail.com>

-- 
Sidney
