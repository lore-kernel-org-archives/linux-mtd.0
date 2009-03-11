Received: from wf-out-1314.google.com ([209.85.200.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LhL6H-0003Bv-IA
	for linux-mtd@lists.infradead.org; Wed, 11 Mar 2009 09:51:51 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2839398wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Mar 2009 02:51:08 -0700 (PDT)
MIME-Version: 1.0
Sender: brijesh.s.singh@gmail.com
In-Reply-To: <F8252D21B3AD45E1A003F69611EA04E0@sky>
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>
Date: Wed, 11 Mar 2009 15:21:08 +0530
Message-ID: <6b5362aa0903110251y3b0d23bcy61b20db12ba8c1e1@mail.gmail.com>
Subject: Re: UBIFS recovery truncates file to zero size
From: Brijesh Singh <brij.singh@samsung.com>
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Mar 11, 2009 at 2:46 PM, Iram Shahzad
<iram.shahzad@jp.fujitsu.com> wrote:
> Hi
>
> I am having the following problem with UBIFS (Linux 2.6.25 + ubifs-v2.6.2=
5).
> Please could you tell me if this is a known issue.
>
> Problem
> =A0 If the power is switched off abruptly while a file is being written,
> =A0 in the next boot the contents of the file is lost. That is, the file
> =A0 becomes zero sized. The problem is reproducable.

May be because of write-back support.  Try disabling it.mount with sync opt=
ion.

For details:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback
