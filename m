Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dR42x-0002ML-Dn
 for linux-mtd@lists.infradead.org; Fri, 30 Jun 2017 22:05:53 +0000
Received: by mail-wm0-x22d.google.com with SMTP id 62so121227006wmw.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2017 15:05:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5C-KMf_DDe2iQATi05AD0dMEV_yqig5Cx7LemkfEAi+UQ@mail.gmail.com>
References: <20170629190120.21245-1-harpreet@nestlabs.com>
 <CAOMZO5C-KMf_DDe2iQATi05AD0dMEV_yqig5Cx7LemkfEAi+UQ@mail.gmail.com>
From: "Harpreet \"Eli\" Sangha" <harpreet@nestlabs.com>
Date: Fri, 30 Jun 2017 15:05:26 -0700
Message-ID: <CAGpcODtD_3QjaSEqi6O3LhBh=ynZe3zJeu+Ng5nbeuzkd5inaw@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: tests: Add Erased Pages Bit Flip Test
To: Fabio Estevam <festevam@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 30, 2017 at 2:48 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Harpreet,
>
> On Thu, Jun 29, 2017 at 4:01 PM, Harpreet Eli Sangha
> <harpreet@nestlabs.com> wrote:
>> From: "Harpreet \"Eli\" Sangha" <harpreet@nestlabs.com>
>>
>> Bit flip detection for written and erased pages tend to have different
>> implementations. Where written pages are detected and corrected using
>> ECC, erased pages are typically detected by ensuring that the number of
>> zeros is less than a specified threshold.
>>
>> As such, it's necessary to have the 'nandbiterrs' test support the
>> testing of written and erased pages. Bit flips in erased pages are
>> emulated by rewriting the page in raw mode, to prevent the use of ECC.
>>
>> Signed-off-by: Harpreet "Eli" Sangha <harpreet@nestlabs.com>
>
> Looks like you missed to add David on Cc once again.
>
> A nitpick: your From and Signed-off-by still do not match.
>
> The From field has two \ character , which is not very common.

Regarding CC'ing David, I didn't realize I was supposed to do that.
I'd assumed you had done it previously as a means of "assigning" the
task to him.  I did not find an official maintainer list and thought
it would be too presumptuous of me to CC him myself rather than
letting it be routed by members of the mail list.

Regarding the backslashes in the From field, it seems something along
the path is deciding to escape quotes in that field.  I will attempt
to address it.

Sorry again.  I will try to resubmit the patch and try to be more
careful in the future.
