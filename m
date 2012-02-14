Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RxORp-0007U7-Sg
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2012 19:53:58 +0000
Received: by yhjj56 with SMTP id j56so306729yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2012 11:53:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1329210112.22240.217.camel@sauron.fi.intel.com>
References: <1328934905-27007-1-git-send-email-computersforpeace@gmail.com>
 <1329210112.22240.217.camel@sauron.fi.intel.com>
Date: Tue, 14 Feb 2012 11:53:56 -0800
Message-ID: <CAN8TOE9AsPc-GyEC7o9ZzDjWTj-JNy3f-VzOoFW0QjsC8duNxA@mail.gmail.com>
Subject: Re: [PATCH] libmtd: fix mtd_write() issues for large data-only writes
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 14, 2012 at 1:01 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Pushed this one and the other 3 patches to mtd-utils.git, thanks a lot!

Thanks for the push! Please note that there are still two patches
outstanding, that you said you pushed earlier but are not in the
repository AFAICT. They were in another thread, with subjects:

[PATCH 1/3] libmtd: perform device checking first
[PATCH 2/3] libmtd_legacy: don't open device in R/W

Sorry for the confusion. I can resend if needed.

Thanks,
Brian
