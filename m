Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIUc0-0007l2-Pm
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 02:52:46 +0000
Received: by mail-ig0-f171.google.com with SMTP id l13so3968326iga.4
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2014 18:52:23 -0800 (PST)
Date: Tue, 25 Feb 2014 18:52:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: Re: [PATCH 1/2] jffs2: Fix segmentation fault found in stress test
Message-ID: <20140226025219.GF4194@ld-irv-0074>
References: <1389015415-25196-1-git-send-email-kamlakant.patel@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389015415-25196-1-git-send-email-kamlakant.patel@broadcom.com>
Cc: Jayachandran C <jchandra@broadcom.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 06, 2014 at 07:06:54PM +0530, Kamlakant Patel wrote:
> Creating a large file on a JFFS2 partition sometimes crashes with this call
> trace:
[...]
> 
> This crash is caused because the 'positions' is declared as an array of signed
> short. The value of position is in the range 0..65535, and will be converted
> to a negative number when the position is greater than 32767 and causes a
> corruption and crash. Changing the definition to 'unsigned short' fixes this
> issue
> 
> Signed-off-by: Jayachandran C <jchandra@broadcom.com>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>

Pushed both patches to l2-mtd.git, and tagged them for -stable. Let me
know if you object.

Thanks,
Brian
