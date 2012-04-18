Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKOeC-0001kI-BU
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 06:45:52 +0000
Received: by lbol5 with SMTP id l5so228082lbo.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 23:45:45 -0700 (PDT)
Message-ID: <1334731400.12496.7.camel@brekeke>
Subject: RE: Query mtd-utils v1.4.9 : flash_erase.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kushwaha Prabhakar-B32579 <B32579@freescale.com>
Date: Wed, 18 Apr 2012 09:43:20 +0300
In-Reply-To: <071A08F2C6A57E4E94D980ECA553F8745F62AA@039-SN1MPN1-005.039d.mgd.msft.net>
References: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE-0GPgbfgrps-ieQb9NYnOFv79TZdxhTyd_ydPboP_8Pg@mail.gmail.com>
 <071A08F2C6A57E4E94D980ECA553F8745EEA99@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE9P9NvD+sRB8MurCkETDKmKUmvkq_M-3kCF+0zaZgsjTg@mail.gmail.com>
 <CAMjpGUf+nEV09MWb5e2kzjJq0SAQGq=iqce2rzt9UON6wkji8w@mail.gmail.com>
 <071A08F2C6A57E4E94D980ECA553F8745F3F98@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAMjpGUc6=H+4QfJmtU7+HY=anP-V5-Ogdmf__NRGQJCjcyHXjQ@mail.gmail.com>
 <071A08F2C6A57E4E94D980ECA553F8745F62AA@039-SN1MPN1-005.039d.mgd.msft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Wood Scott-B07421 <B07421@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On Mon, 2012-04-09 at 06:53 +0000, Kushwaha Prabhakar-B32579 wrote:
> A general question why these type of patches are not coming in mtd-utils.
> Is it because going forward UBIFS is the next file system and nobody wants to focus jffs2.

No one would reject good patches which make JFFS2 and related tools work
on modern flashes. Feel free to submit. WRT to the links you posted -
this was long time ago and I do not remember why they were not merged.
But it looks like Stanley wanted to send a new version but never did
that. Please, read the discussion here:

http://thread.gmane.org/gmane.linux.drivers.mtd/30476/focus=31352

BTW, I agree with Mike that -j option is misplaced and it wold be
cleaner to create a separate jffs2format tool.

Artem.
