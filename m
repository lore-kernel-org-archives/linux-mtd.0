Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YagsQ-0001QT-DL
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 08:41:27 +0000
Message-ID: <1427272860.30360.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] UBIFS: fix incorrect unlocking handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Taesoo Kim <tsgatesv@gmail.com>
Date: Wed, 25 Mar 2015 10:41:00 +0200
In-Reply-To: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
References: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: taesoo@gatech.edu, sanidhya@gatech.edu, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, blee@gatech.edu,
 csong84@gatech.edu, changwoo@gatech.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-03-17 at 22:09 -0400, Taesoo Kim wrote:
> When ubifs_init_security() fails, 'ui_mutex' is incorrectly
> unlocked and incorrectly restores 'i_size'. There are four
> such places that were introduce by the last commit.
> 
> Signed-off-by: Taesoo Kim <tsgatesv@gmail.com>

Pushed to linux-ubifs.git/master, thanks!
