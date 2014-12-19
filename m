Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1rmV-0003Bi-Hx
 for linux-mtd@lists.infradead.org; Fri, 19 Dec 2014 07:15:24 +0000
Received: by mail-vc0-f177.google.com with SMTP id ij19so130374vcb.22
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 23:15:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54938ACF.3020904@huawei.com>
References: <8EE5FC3D-A32C-4D02-B5AB-0A6E549F3E43@axis.com>
 <54938ACF.3020904@huawei.com>
Date: Fri, 19 Dec 2014 08:15:01 +0100
Message-ID: <CAFLxGvzYrRyr_sjqJuK=yzMNLdOKc-jbuo5rx2eX9_2Hxvx9fg@mail.gmail.com>
Subject: Re: do_sys_name_to_handle on UBIFS
From: Richard Weinberger <richard.weinberger@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Umut Tezduyar Lindskog <umut.tezduyar@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 19, 2014 at 3:17 AM, hujianyang <hujianyang@huawei.com> wrote:
> On 2014/12/17 20:39, Umut Tezduyar Lindskog wrote:
>> Hi,
>>
>> I have noticed that name_to_handle() system call is failing on UBIFS due=
 to missing super_block.s_export_op. Is there a reason why this hasn=E2=80=
=99t been implemented on UBI?
>>
>
> As I know, this *struct export_operations* is used for nfsd. But
> NFS is not supported with UBIFS. So I guess this is the reason
> why super_block.s_export_op is missing.

This is correct. UBIFS is not exportable, so no handles for you. :-)

--=20
Thanks,
//richard
