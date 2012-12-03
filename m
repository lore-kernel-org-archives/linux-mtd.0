Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfXXz-0005gH-8i
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 15:03:04 +0000
Date: Mon, 3 Dec 2012 16:02:58 +0100
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: Re: UBI wl_tree_add problems after PEB scrubbed
Message-ID: <20121203160258.4a719a67@spider.haslach.nod.at>
In-Reply-To: <1354545960.11583.17.camel@sauron.fi.intel.com>
References: <50B8CB36.3010604@itwatchdogs.com>
 <1354545960.11583.17.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Zach Sadecki <zsadecki@itwatchdogs.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mon, 03 Dec 2012 16:46:00 +0200
schrieb Artem Bityutskiy <dedekind1@gmail.com>:

> /me looks at Richard...

/me looks at the code. ;)

> OK, I confirm that this is fastmap to blame. Namely, this commit:

CONFIG_MTD_UBI_FASTMAP is y and ubi.fm_autoconvert is 1, correct?
What tests are you using? ubi-tests?

Does the issue still happen if you disable ubi_self_check_all_ff() in
__wl_get_peb()
And yeah, that's a very stupid bug, I'm very sorry.

I'm running ubi-tests now for a while, self_check_ec() triggered once,
but I've never seen "UBI assert failed in wl_tree_add at 204" so far.

Thanks,
//richard
