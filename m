Received: from mga11.intel.com ([192.55.52.93])
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWKj-0007pe-JJ
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 13:45:02 +0000
Message-ID: <1396964655.26672.67.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH] mtd: ubi: Test return value of __wl_get_peb
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Tue, 08 Apr 2014 16:44:15 +0300
In-Reply-To: <1396339273-15904-1-git-send-email-tlinder@codeaurora.org>
References: <1396339273-15904-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 11:01 +0300, Tanya Brokhman wrote:
> In case of an error (if there are not free PEB's for example),
> __wl_get_peb will return a negative value. In order to prevent access
> violation we need to test the returned value prior to using it later on.
> 
> Signed-off-by: Tatyana Brokhman <tlinder@codeaurora.org>

Pushed to linux-ubifs.git / master, thanks!

-- 
Best Regards,
Artem Bityutskiy
