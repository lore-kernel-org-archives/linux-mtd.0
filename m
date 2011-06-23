Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZlQ5-0006FU-Tw
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 15:02:14 +0000
Received: by pzk28 with SMTP id 28so1324321pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 08:02:08 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 23 Jun 2011 18:02:51 +0300
In-Reply-To: <1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308841377.23597.10.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-22 at 09:49 -0700, Brian Norris wrote:
> Hello,
> 
> I think this should be the last version necessary for this particular patch
> series...
> 
> This series adds, changes, and deprecates several nanddump options, helping make
> nanddump a closer inverse to nandwrite. This is mostly a preparation for the
> next release, when several defaults might change. A short list of the planned
> changes:
> 
>  * unify bad block methods under `--bb=METHOD', deprecating old ones
>  * kill --omitbad in favor of --bb=skipbad
>  * skip bad blocks by default (i.e., --bb=skipbad)
>  * do not dump OOB by default (--omitoob)
>  * add `--oob' to force dumping OOB
> 
> Please let me know when these are accepted and the 1.4.5 release is made, so I
> can send a proper patchset to clean this all up as planned for the 1.4.6
> release.

Pushed, thank you!

> BTW, is each utility supposed to have its own version? (e.g., nanddump has
> version 1.30?) Should these versions be kept in any kind of sync with the
> mtd-utils revision tags? And does Artem take care of this stuff?

Actually no, I do not take care of this and this is messy. Probably it
would be easier if all utils had the same version as the release...

-- 
Best Regards,
Artem Bityutskiy
