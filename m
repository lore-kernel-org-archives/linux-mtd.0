Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178F8S-00032x-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 07:53:12 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Wed, 15 May 2002 23:53:04 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Cc: "Ho-Kuo Chan" <hchan@wavesat.com>
Subject: Re: Trouble indetifying FLASH part
Reply-To: zeusj@firstlinux.net
Message-Id: <20020516065304.5A8A136F9@sitemail.everyone.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--- "Ho-Kuo Chan" <hchan@wavesat.com> wrote:
>    I have a PPC405GP based board with a single AMD compatible Toshiba
>TC58FVB321FT 4MB flash in word mode. The chip is physically mapped to
>address 0x8000000 and according to the Data Sheet, is CFI compatible. I
>believe I have properly configured the kernel but I can't seem to get my
>chip identified. Am I missing sonething? Any help is greatly appreciated!!

You should write own map code in maps directory. 



Jim Zeus

_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
