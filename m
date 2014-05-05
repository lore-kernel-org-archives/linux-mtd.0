Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhGmH-0002Yy-7D
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 11:09:45 +0000
Message-ID: <1399288152.15290.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/3] nandtest: Introduce multiple reads & check iterations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Mon, 05 May 2014 14:09:12 +0300
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACA6B9@DBDE04.ent.ti.com>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
 <20140505103335.GF2873@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EACA6B9@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guido =?ISO-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-05-05 at 10:58 +0000, Gupta, Pekon wrote:
> Therefore, I'm not sure having re-reads is a good test or not, because
> re-reads is changing the underlying testing scenario by introducing
> _new_
> bit-flips in neighboring regions pages because of read-disturbs.

If the driver / HW cannot properly handle 4 re-reads, we do want the
test to catch this, I think, irrespective of the true nature of the
error.

Therefore, I see this patch with a default 4 as an improvement.

-- 
Best Regards,
Artem Bityutskiy
