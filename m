Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8NVL-0004x4-1Q
 for linux-mtd@lists.infradead.org; Tue, 06 Jan 2015 06:20:35 +0000
Received: by mail-pa0-f50.google.com with SMTP id bj1so30465843pad.9
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2015 22:20:13 -0800 (PST)
Date: Mon, 5 Jan 2015 22:20:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH mtd-www 1/4] footer: drop 'Last updated' and other buggy
 footer notices
Message-ID: <20150106062003.GA13447@norris-Latitude-E6410>
References: <1419043106-16453-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1419043106-16453-1-git-send-email-computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 19, 2014 at 06:38:23PM -0800, Brian Norris wrote:
> These "last updated" messages are often wrong, and are rarely useful. We
> could also drop the VAR_CVSID definitions from all the other source
> files, but there's no need at the moment.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed all to mtd-www.git.

Brian
