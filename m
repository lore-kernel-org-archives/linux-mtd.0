Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181b0J-0008Cx-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 00:21:35 +0100
Message-ID: <3DACA2ED.4FACBDFD@analog.com>
Date: Tue, 15 Oct 2002 16:21:17 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Hoping for a little insight
References: <3DAC9026.B3F4550B@analog.com> <11684.1034720007@passion.cambridge.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> justin.wojdacki@analog.com said:
> >  I am trying to copy a largish file (well, relative to the flash size)
> > and after a variable point in the copy, "cp" goes to sleep and never
> > wakes up again.
> 
> SysRq-T.
> 
> --
> dwmw2

Sorry, no luck getting SysRq-T to work. I think the host OS
(WindowsXP) or terminal program (TeraTerm) might be swallowing it. 

If I cat /proc/X/status, I see the following:

Name:   cp
State:  S (sleeping)
Tgid:   30
Pid:    30
PPid:   27
TracerPid:      0
Uid:    0       0       0       0
Gid:    0       0       0       0
FDSize: 32
Groups:
VmSize:      392 kB
VmLck:         0 kB
VmRSS:       104 kB
VmData:       20 kB
VmStk:         4 kB
VmExe:         0 kB
VmLib:         0 kB
SigPnd: 00000000000000000000000000000000
SigBlk: 00000000000000000000000000000000
SigIgn: 00000000000000000000000000000006
SigCgt: 00000000000000000000000000000000
CapInh: 0000000000000000
CapPrm: 00000000fffffeff
CapEff: 00000000fffffeff

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
