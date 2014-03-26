Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WShPn-0004cd-Bc
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 06:34:20 +0000
Received: by mail-pa0-f52.google.com with SMTP id rd3so1514231pab.11
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 23:33:57 -0700 (PDT)
Date: Tue, 25 Mar 2014 23:33:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: mtd: nand: fix GET/SET_FEATURES address on 16-bit devices
Message-ID: <20140326063352.GA31517@norris-Latitude-E6410>
References: <1395439510-18860-1-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395439510-18860-1-git-send-email-davidm@egauge.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 21, 2014 at 04:05:10PM -0600, David Mosberger wrote:
> GET_FEATURES and SET_FEATURES also need byte-addressing on 16-bit devices.
> 
> Signed-off-by: David Mosberger <davidm@egauge.net>

Pushed to l2-mtd.git. Thanks!

Brian
