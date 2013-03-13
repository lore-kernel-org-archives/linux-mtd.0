Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjTV-0004SN-Km
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:04:02 +0000
Message-ID: <1363172692.11441.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/9] mtd: add 'const' qualifiers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Date: Wed, 13 Mar 2013 13:04:52 +0200
In-Reply-To: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
References: <1363086508-2405-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Michael Buesch <m@bues.ch>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-12 at 13:08 +0200, Artem Bityutskiy wrote:
> This patch-set amends declarations of arrays of partition parser names, as well
> as declarations of few MTD functions which deal with such arrays.

Pushed to l2-mtd.git.

-- 
Best Regards,
Artem Bityutskiy
