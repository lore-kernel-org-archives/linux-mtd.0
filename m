Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8Cw6-00012a-OE
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 14:45:23 +0000
Received: by mail-vw0-f47.google.com with SMTP id 2so4156756vws.34
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 07:45:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302198035-32577-1-git-send-email-marathon96@gmail.com>
References: <1302198035-32577-1-git-send-email-marathon96@gmail.com>
Date: Fri, 8 Apr 2011 10:45:20 -0400
Message-ID: <BANLkTik0LfxcfridxFAGtm2KYpwngvokSQ@mail.gmail.com>
Subject: Re: [PATCH v4] Retry Large Buffer Allocations
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Grant Erickson <marathon96@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	Bastian.Ruppert@sewerin.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Grant, Artem

Thanks for this fix!

On Thu, Apr 7, 2011 at 1:40 PM, Grant Erickson <marathon96@gmail.com> wrote=
:
> When handling user space read or write requests via mtd_{read,write}
> or JFFS2 medium scan requests, exponentially back off on the size of
> the requested kernel transfer buffer until it succeeds or until the
> requested transfer buffer size falls below the page size.
>
> This helps ensure the operation can succeed under low-memory,
> highly-fragmented situations albeit somewhat more slowly.
>
> =A0v2: Incorporated coding style and comment feedback from Artem.
> =A0v3: Incorporated more feedback from Artem. Retargeted patch against
> =A0 =A0 =A0l2-mtd-2.6.
> =A0v4: Incorporated feedback from Artem about compilation on 64-bit
> =A0 =A0 =A0architectures.
>
> Signed-off-by: Grant Erickson <marathon96@gmail.com>

I tested this on da850evm by cherry-picking commit
64542ac252d378dc7a1122064821a884e85a9954 from
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git.

I have a memory hole @32M (bootargs: mem=3D32M@0xc0000000
mem=3D64M@0xc4000000) and I was also (like Bastian) getting "ubiformat:
page allocation failure" errors.  Cherry-picking this commit fixed the
problem for me; I was able to do 3x repeated ubiformats without error.

Tested-by: Ben Gardiner <bengardiner@nanometrics.ca>

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
