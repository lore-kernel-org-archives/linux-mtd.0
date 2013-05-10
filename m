Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UahRD-00014U-FC
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 07:08:20 +0000
Date: Fri, 10 May 2013 09:07:53 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH [mtd-utils] 3/3] mkfs.ubifs: allow reformatting of devices
In-Reply-To: <1368030446-343-3-git-send-email-vapier@gentoo.org>
Message-ID: <alpine.DEB.2.00.1305100902410.22700@lnxricardw.se.axis.com>
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <1368030446-343-3-git-send-email-vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 8 May 2013, Mike Frysinger wrote:

> Sometimes I want to re-initialize an existing ubifs, but the tool
> currently bails out if the volume is already formatted.  Prompt the
> user instead so they can decide.
>
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> ...
> 	{"root",               1, NULL, 'r'},
> @@ -142,6 +143,7 @@ static const struct option longopts[] = {
> 	{"max-leb-cnt",        1, NULL, 'c'},
> 	{"output",             1, NULL, 'o'},
> 	{"devtable",           1, NULL, 'D'},
> +	{"yes",                0, NULL, 'y'},
> 	{"help",               0, NULL, 'h'},
> 	{"verbose",            0, NULL, 'v'},
> 	{"version",            0, NULL, 'V'},
> @@ -191,6 +193,7 @@ static const char *helptext =
> "-U, --squash-uids        squash owners making all files owned by root\n"
> "-l, --log-lebs=COUNT     count of erase blocks for the log (used only for\n"
> "                         debugging)\n"
> +"-y, --yes                assume the answer is \"yes\" for all questions\n"
> ...

Wouldn't it be better to have a specific option for this specific case, 
rather than a general yes-to-everything option? The latter makes sense 
with programs such as fsck where the only prompt basically is 'I found a 
fault, shall I fix it?', but in this is case it can be difficult to 
predict the outcome should the option start to cover more potential 
questions in the future.

-f and -F are already taken, but I was thinking something along the lines of:

"-T, --reformat		format an existing ubifs even if already formatted"

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
