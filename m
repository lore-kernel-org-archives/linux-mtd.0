Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ruflw-0006Mh-9q
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 07:47:28 +0000
Received: by wico1 with SMTP id o1so5742812wic.36
 for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2012 23:47:26 -0800 (PST)
Date: Tue, 7 Feb 2012 09:47:15 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/3] mtd: remove retlen zeroing duplication
Message-ID: <20120207094715.63ffbe78@pixies.home.jungo.com>
In-Reply-To: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
References: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  6 Feb 2012 14:03:07 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> The MTD API function now zero the 'retlen' parameter before calling
> the driver's method - do not do this again in dirvers. This removes
> duplicated '*retlen = 0' assignent from the following methods:
> 
>     'mtd_point()'
>     'mtd_read()'
>     'mtd_write()'
>     'mtd_writev()'
>     'mtd_panic_write()'
> 

Seems that '*retlen = 0' is missing from mtd_read() in l2-mtd.
Deliberately? or am I looking at the wrong repo?

Regards
Shmulik
