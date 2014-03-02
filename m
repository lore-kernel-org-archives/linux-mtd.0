Received: from mail-ig0-f171.google.com ([209.85.213.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJyxF-0002nD-Ov
 for linux-mtd@lists.infradead.org; Sun, 02 Mar 2014 05:28:51 +0000
Received: by mail-ig0-f171.google.com with SMTP id hl1so2570825igb.4
 for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2014 21:28:27 -0800 (PST)
Received: from [10.0.7.250] ([12.161.8.199])
 by mx.google.com with ESMTPSA id y9sm25324003igl.7.2014.03.01.21.28.24
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Sat, 01 Mar 2014 21:28:25 -0800 (PST)
Message-ID: <5312C17A.6010600@mds.com>
Date: Sat, 01 Mar 2014 23:28:26 -0600
From: Chuck Peplinski <chuck@mds.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <201402272101.59845.marex@denx.de>
 <106fa8b5760a4a88be8cb469fab79186@BY2PR07MB011.namprd07.prod.outlook.com>
 <201403012022.10111.marex@denx.de>
In-Reply-To: <201403012022.10111.marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: chuck@mds.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry about top posting.
I am also using this n25q512.  My working code includes a fix similar to 
what Song posted.  I don't consider it elegant.  The problem is that 
this 25q512 apparently behaves in a unique fashion.  If you read the 
status register instead of the flag status register, reads work but 
erases and writes fail.  I know this from a couple of days of 
debugging.  You must respond to the flag status register.  Yes, this is 
different from every other part.

Some possible solutions are:
- hard code support for this device, as Song did.
- add some other abstraction that affects support for every other part.
I leave the decision to you, but neither sounds very pretty.

     Chuck

On 3/1/2014 1:22 PM, Marek Vasut wrote:
> To me, it looks like FSR bit 7 and SR bit 7 should toggle exactly at the same
> time and exactly for the same events. Can you try for example reading them both
> and checking that the bit 7 really toggles at different times please?
>
