Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2cCd-0005Ra-69
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 09:21:43 +0000
Message-ID: <1433928078.14092.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Wed, 10 Jun 2015 12:21:18 +0300
In-Reply-To: <5577AC03.9060909@cn.fujitsu.com>
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1433831809.28854.17.camel@sauron.fi.intel.com> <55769D97.3010602@nod.at>
 <5577AC03.9060909@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-06-10 at 11:16 +0800, Dongsheng Yang wrote:
> Therefore, I introduced a new option named as force_atime in ubifs.
> That's a ubifs-dependent opiton and it works as a main switch, in
> a higher level compared with atime and noatime. If force_atime, we
> support the atime-related flags. Otherwise, we don't care about all of
> them in flags and don't support atime anyway.

How bad is it to just default to relatime like other file-systems do,
comparing to what we have now?
