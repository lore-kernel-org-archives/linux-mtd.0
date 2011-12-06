Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXttm-000895-1T
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:13:27 +0000
Received: by fabs1 with SMTP id s1so2447249fab.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2011 04:13:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323172965.2163.5.camel@koala>
References: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
 <1323172965.2163.5.camel@koala>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 6 Dec 2011 13:13:03 +0100
Message-ID: <CAOiHx==avQMJiATzfcgHKe4AP8D2fjHyirG4RpT4hmeakabcZA@mail.gmail.com>
Subject: Re: [PATCH 0/7] MTD: MAPS: remove bcm963xx-flash
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6 December 2011 13:02, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2011-12-05 at 16:08 +0100, Jonas Gorski wrote:
>> While trying to improve the bcm963xx CFE partition parsing, I noticed
>> that it could be completely replaced by the generic physmap flash
>> driver using a custom parser.
>
> Hi,
>
> would you please send a version which applies cleanly to my
> l2-mtd-2.6.git tree:
>
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

On Mon, 2011-12-05 at 16:08 +0100, Jonas Gorski wrote:
> P.S: This patchset is based on l2-mtd-2.6.git, which seems to be the
> "correct" tree now (the website says mtd-2.6.git, but it doesn't look
> like the correct one, having no commits).

And these patches do apply cleanly for me on my local copy of your git
(latest commit from 29 hours ago according to gitweb).


Regards
Jonas
