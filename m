Return-Path: <SRS0=Slyc=WO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5256C3A589
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 20:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BA5921873
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Aug 2019 20:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a44JpKsh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO+GKkzF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BA5921873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TP8Kh55QHN2e4MeZYpAQBDq6rWAS1XobxsvXWQWl6ZU=; b=a44JpKshDAS7z6CphMtk7M58V
	n4npk+q1G3UCNOGC0wNP2JKchFPeNpgjH5a0mk5O4zL4FryNnHsBk1WcuNAnBknoRIn9mXH49Z+9f
	zry0SYFpEczey76jBq+ifwKUntlgdjBB3s2xbAWN7eczrSbWGVJX8lXSy8Sfaxd177mVHH0Aq/zwW
	AWzjkx8zg8/J9fSlX7zrQMwhCESgC/AuMFheOkqneaEkioicn66kYlu7WTPTMz16t4mPCyyT8EJ/L
	+io7ZyWeG9vgn9lVccUi9uagZLovQ3duyBpgKAfndAoNuiAH9N9zhu7kLNMgq5WOF6LfL9j2JRnJ7
	Py+iFTXYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzS7w-0006Pp-Nl; Sun, 18 Aug 2019 20:50:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzS7u-0006P5-83
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2019 20:50:12 +0000
Received: by mail-wm1-x344.google.com with SMTP id l2so1255022wmg.0
 for <linux-mtd@lists.infradead.org>; Sun, 18 Aug 2019 13:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oje0Gr93GJX8iXh0y3ZwALbuwaRQnWv3gyaeb8UW/2s=;
 b=hO+GKkzFW8GRD8bvdgR4XHPEYppq/Xvny5tz8VMmL24rGKUxT6WN4QHwo7fstwSUDW
 GCQIpNmaR/HcZv+gIXc+fVyD5Qz/YQYqT6ZGTlESAlStipz/5s8/KByYPyp2GutIChSu
 dBb8bXguli4Ez8VosJ6uEnDU/Ij6yruG0rJxQMIM/dP8AJgHSWsjUE/U+I5lCIw9ne4u
 or/BBNpDPffz6ZBf59NEHABZ+KMDuAnMSqo5xu8DnXHyhOvRh9simtq3Etoc9w13FcNW
 CIfzUx+rt1RcZ05KBidiW2xefMncT7IJOzq019T3+cOVd4Q4BhSfkcki9zFFM0oi780z
 RVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oje0Gr93GJX8iXh0y3ZwALbuwaRQnWv3gyaeb8UW/2s=;
 b=g87TtFIaYiM7J7l+laASF60aozW9hDp7Twwgm/CGiL/T0F2TbssxN66pzqElnFdoIA
 Cb/PirnC++gvIeiOtNc/9N+MN0uUp3A6byOiIC/6XNW021Zt0Iug1Z6eQo3TMnYhx7/3
 y22sjcT+X62fN6gGMgshj91UURkouNRjuAa+QkteAfIbyYfl94NLVqrmQ7+b2vYdlEJY
 tkPPWBOAe2lZub4PjI9ns/mrnFKdQxIDIar1FeLm/B9WSJcwbooV4Zy5ql5pZ7qBsmEG
 kHR9zufQ5OycUE54lgi7+fZD/ygH19bFVK54ihHe7mQsI58NwOmHXkyZpwAhuOfm44zJ
 tGGg==
X-Gm-Message-State: APjAAAXZA+vBLucvfCLRvw5mePk+yGPd1e+YaBHK7CYt2XVjbIGlViz9
 rR9AYOj8ACABMqqABad++eMxNSWuLOgBX69mqXo=
X-Google-Smtp-Source: APXvYqyhCWb4bjEMI7kOx5/Faeb23vyOO6ZmUr4lg3rw+67VP8Zv1W9PQKKjj19I3xJAMxF6S0UZuBhpYnym4ZGsATs=
X-Received: by 2002:a7b:c155:: with SMTP id z21mr17098547wmi.137.1566161408360; 
 Sun, 18 Aug 2019 13:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
 <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
In-Reply-To: <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 18 Aug 2019 22:49:56 +0200
Message-ID: <CAFLxGvxoR2kWoEz38QfO2sZDh4=4KXHBm9OrzXAQJWAR8Shmew@mail.gmail.com>
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Emil Lenngren <emil.lenngren@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000682f4c05906a5eef"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_135010_319216_30991CEC 
X-CRM114-Status: GOOD (  24.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Patrick Doyle <wpdster@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000682f4c05906a5eef
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 14, 2019 at 2:34 PM Emil Lenngren <emil.lenngren@gmail.com> wrote:
> > Isn't this why we have udev, to create fancy by-id/by-path/... naming conventions?
> >
> > Thanks,
> > //richard
>
> I actually implemented the same change some time ago, for the exact
> same reason (swapping two volumes and then reboot). Referring to an
> ubi volume by name is more convenient than volume numbers, since names
> can be changed and numbers can't.
> Is it maybe possible to define both /dev/ubiblock%d_%d and
> /dev/ubiblock%d_%s at the same time?
> How would this be done with udev instead to get "fancy by-id"?

Thanks for bringing this topic up again.
udev allows rules and even helper (scripts) to gain device
attributes. These can then be used to name/symlink devices as you want.

For example, if you want to have device symlinks by name for UBI
volumes, you can create a rule like that:
KERNEL=="ubi?_?", IMPORT{program}="/etc/udev/rules.d/ubi_probe
$devnode", SYMLINK="ubi%E{MTD_NUM}_%E{VOL_NAME}"

With ubi_probe being:
#!/bin/sh
VOL_NAME="$(cat /sys/${DEVPATH}/name)"
MTD_NUM="$(cat /sys/${DEVPATH}/../mtd_num)"
echo "VOL_NAME=${VOL_NAME}"
echo "MTD_NUM=${MTD_NUM}"

I took the chance and reviewed UBI's sysfs interface and found a few
things which need
improvement. With these issues addressed you can also work with
ubiblock by name:
1. UBI does not export the UBI device number via sysfs. In 99% of all
cases mtd_num will be correct,
but you can select the UBI number upon attach time.
2. UBI does not emit a change kevent when an volume is renamed. So
udev does not see the rename command.
3. ubiblock does not set the UBI volume as parent device.

So we can then have a rule like:
KERNEL=="ubiblock?_?",
IMPORT{program}="/etc/udev/rules.d/ubiblock_probe $devnode"
SYMLINK="ubiblock$number_%E{VOL_NAME}"

With ubiblock_probe being:
#!/bin/sh
VOL_NAME="$(cat /sys/${DEVPATH}/device/name)"
echo "VOL_NAME=${VOL_NAME}"

# ls -ltr /dev/ubiblock*
brw-rw---- 1 root disk 251, 0 18. Aug 22:41 /dev/ubiblock7_0
lrwxrwxrwx 1 root root     11 18. Aug 22:41 /dev/ubiblock0_test -> ubiblock7_0
# ubirename /dev/ubi7 test lala
# ls -ltr /dev/ubiblock*
brw-rw---- 1 root disk 251, 0 18. Aug 22:42 /dev/ubiblock7_0
lrwxrwxrwx 1 root root     11 18. Aug 22:42 /dev/ubiblock0_lala -> ubiblock7_0

Does this help? If you need other/more sysfs changes, please tell. :-)
Attached you can find my WIP patch for these changes. I need to double check
a few things first before I will send a formal patch.

I think it would even make sense to integrate a more powerful
ubi_probe (as C program) into systemd-udev
like we already have for mtd itself.

-- 
Thanks,
//richard

--000000000000682f4c05906a5eef
Content-Type: text/x-patch; charset="US-ASCII"; name="ubi_sysfs_wip.diff"
Content-Disposition: attachment; filename="ubi_sysfs_wip.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_jzhfz79k0>
X-Attachment-Id: f_jzhfz79k0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jIGIvZHJpdmVycy9tdGQvdWJpL2Js
b2NrLmMKaW5kZXggNjAyNTM5ODk1NWEyLi42Y2FhYjg1OTA3YmQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL3ViaS9ibG9jay5jCisrKyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCkBAIC0zNDUs
NyArMzQ1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBibGtfbXFfb3BzIHViaWJsb2NrX21xX29w
cyA9IHsKIAkuaW5pdF9yZXF1ZXN0CT0gdWJpYmxvY2tfaW5pdF9yZXF1ZXN0LAogfTsKIAotaW50
IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKK2ludCB1YmlibG9j
a19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmksIHN0cnVjdCBkZXZpY2UgKnViaV9k
ZXYpCiB7CiAJc3RydWN0IHViaWJsb2NrICpkZXY7CiAJc3RydWN0IGdlbmRpc2sgKmdkOwpAQCAt
NDMzLDcgKzQzMyw3IEBAIGludCB1YmlibG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5m
byAqdmkpCiAJbGlzdF9hZGRfdGFpbCgmZGV2LT5saXN0LCAmdWJpYmxvY2tfZGV2aWNlcyk7CiAK
IAkvKiBNdXN0IGJlIHRoZSBsYXN0IHN0ZXA6IGFueW9uZSBjYW4gY2FsbCBmaWxlIG9wcyBmcm9t
IG5vdyBvbiAqLwotCWFkZF9kaXNrKGRldi0+Z2QpOworCWRldmljZV9hZGRfZGlzayh1YmlfZGV2
LCBkZXYtPmdkLCBOVUxMKTsKIAlkZXZfaW5mbyhkaXNrX3RvX2RldihkZXYtPmdkKSwgImNyZWF0
ZWQgZnJvbSB1YmklZDolZCglcykiLAogCQkgZGV2LT51YmlfbnVtLCBkZXYtPnZvbF9pZCwgdmkt
Pm5hbWUpOwogCW11dGV4X3VubG9jaygmZGV2aWNlc19tdXRleCk7CkBAIC01MDQsNiArNTA0LDIz
IEBAIGludCB1YmlibG9ja19yZW1vdmUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCiAJcmV0
dXJuIHJldDsKIH0KIAorc3RhdGljIHZvaWQgdWJpYmxvY2tfbm90aWZ5X3JlbmFtZShzdHJ1Y3Qg
dWJpX3ZvbHVtZV9pbmZvICp2aSkKK3sKKwlzdHJ1Y3QgdWJpYmxvY2sgKmRldjsKKworCW11dGV4
X2xvY2soJmRldmljZXNfbXV0ZXgpOworCWRldiA9IGZpbmRfZGV2X25vbG9jayh2aS0+dWJpX251
bSwgdmktPnZvbF9pZCk7CisJaWYgKCFkZXYpIHsKKwkJbXV0ZXhfdW5sb2NrKCZkZXZpY2VzX211
dGV4KTsKKwkJcmV0dXJuOworCX0KKworCW11dGV4X2xvY2soJmRldi0+ZGV2X211dGV4KTsKKwlr
b2JqZWN0X3VldmVudCgmZGlza190b19kZXYoZGV2LT5nZCktPmtvYmosIEtPQkpfQ0hBTkdFKTsK
KwltdXRleF91bmxvY2soJmRldi0+ZGV2X211dGV4KTsKKwltdXRleF91bmxvY2soJmRldmljZXNf
bXV0ZXgpOworfQorCiBzdGF0aWMgaW50IHViaWJsb2NrX3Jlc2l6ZShzdHJ1Y3QgdWJpX3ZvbHVt
ZV9pbmZvICp2aSkKIHsKIAlzdHJ1Y3QgdWJpYmxvY2sgKmRldjsKQEAgLTU2NSw2ICs1ODIsOCBA
QCBzdGF0aWMgaW50IHViaWJsb2NrX25vdGlmeShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLAog
CQlpZiAobnQtPnZpLnZvbF90eXBlID09IFVCSV9TVEFUSUNfVk9MVU1FKQogCQkJdWJpYmxvY2tf
cmVzaXplKCZudC0+dmkpOwogCQlicmVhazsKKwljYXNlIFVCSV9WT0xVTUVfUkVOQU1FRDoKKwkJ
dWJpYmxvY2tfbm90aWZ5X3JlbmFtZSgmbnQtPnZpKTsKIAlkZWZhdWx0OgogCQlicmVhazsKIAl9
CkBAIC02MTMsOSArNjMyLDggQEAgc3RhdGljIHZvaWQgX19pbml0IHViaWJsb2NrX2NyZWF0ZV9m
cm9tX3BhcmFtKHZvaWQpCiAJCX0KIAogCQl1YmlfZ2V0X3ZvbHVtZV9pbmZvKGRlc2MsICZ2aSk7
CisJCXJldCA9IHViaWJsb2NrX2NyZWF0ZSgmdmksICZkZXNjLT52b2wtPmRldik7CiAJCXViaV9j
bG9zZV92b2x1bWUoZGVzYyk7Ci0KLQkJcmV0ID0gdWJpYmxvY2tfY3JlYXRlKCZ2aSk7CiAJCWlm
IChyZXQpIHsKIAkJCXByX2VycigKIAkJCSAgICAgICAiVUJJOiBibG9jazogY2FuJ3QgYWRkICcl
cycgdm9sdW1lIG9uIHViaSVkXyVkLCBlcnI9JWRcbiIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC91YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCmluZGV4IGQ2MzZiYmUyMTRj
Yi4uMTM0NDkyYTE3MThjIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYworKysg
Yi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwpAQCAtMTQwLDYgKzE0MCw4IEBAIHN0YXRpYyBzdHJ1
Y3QgZGV2aWNlX2F0dHJpYnV0ZSBkZXZfbXRkX251bSA9CiAJX19BVFRSKG10ZF9udW0sIFNfSVJV
R08sIGRldl9hdHRyaWJ1dGVfc2hvdywgTlVMTCk7CiBzdGF0aWMgc3RydWN0IGRldmljZV9hdHRy
aWJ1dGUgZGV2X3JvX21vZGUgPQogCV9fQVRUUihyb19tb2RlLCBTX0lSVUdPLCBkZXZfYXR0cmli
dXRlX3Nob3csIE5VTEwpOworc3RhdGljIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlIGRldl91Ymlf
bnVtID0KKwlfX0FUVFIodWJpX251bSwgU19JUlVHTywgZGV2X2F0dHJpYnV0ZV9zaG93LCBOVUxM
KTsKIAogLyoqCiAgKiB1Ymlfdm9sdW1lX25vdGlmeSAtIHNlbmQgYSB2b2x1bWUgY2hhbmdlIG5v
dGlmaWNhdGlvbi4KQEAgLTM3OCw2ICszODAsOCBAQCBzdGF0aWMgc3NpemVfdCBkZXZfYXR0cmli
dXRlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAogCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4i
LCB1YmktPm10ZC0+aW5kZXgpOwogCWVsc2UgaWYgKGF0dHIgPT0gJmRldl9yb19tb2RlKQogCQly
ZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmktPnJvX21vZGUpOworCWVsc2UgaWYgKGF0dHIg
PT0gJmRldl91YmlfbnVtKQorCQlyZXQgPSBzcHJpbnRmKGJ1ZiwgIiVkXG4iLCB1YmktPnViaV9u
dW0pOwogCWVsc2UKIAkJcmV0ID0gLUVJTlZBTDsKIApAQCAtMzk4LDYgKzQwMiw3IEBAIHN0YXRp
YyBzdHJ1Y3QgYXR0cmlidXRlICp1YmlfZGV2X2F0dHJzW10gPSB7CiAJJmRldl9iZ3RfZW5hYmxl
ZC5hdHRyLAogCSZkZXZfbXRkX251bS5hdHRyLAogCSZkZXZfcm9fbW9kZS5hdHRyLAorCSZkZXZf
dWJpX251bS5hdHRyLAogCU5VTEwKIH07CiBBVFRSSUJVVEVfR1JPVVBTKHViaV9kZXYpOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2NkZXYuYyBiL2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMK
aW5kZXggMWI3N2ZmZjlmODkyLi5hN2FjNTBjZWNjMDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L3ViaS9jZGV2LmMKKysrIGIvZHJpdmVycy9tdGQvdWJpL2NkZXYuYwpAQCAtNTYyLDcgKzU2Miw3
IEBAIHN0YXRpYyBsb25nIHZvbF9jZGV2X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25l
ZCBpbnQgY21kLAogCQlzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvIHZpOwogCiAJCXViaV9nZXRfdm9s
dW1lX2luZm8oZGVzYywgJnZpKTsKLQkJZXJyID0gdWJpYmxvY2tfY3JlYXRlKCZ2aSk7CisJCWVy
ciA9IHViaWJsb2NrX2NyZWF0ZSgmdmksICZkZXNjLT52b2wtPmRldik7CiAJCWJyZWFrOwogCX0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL3ViaS5oIGIvZHJpdmVycy9tdGQvdWJpL3Vi
aS5oCmluZGV4IDcyMWI2YWE3OTM2Yy4uY2I5MGQ2MWY1ZjA3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L210ZC91YmkvdWJpLmgKKysrIGIvZHJpdmVycy9tdGQvdWJpL3ViaS5oCkBAIC05NzYsMTIgKzk3
NiwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdWJpX2Zhc3RtYXBfZGVzdHJveV9jaGVja21hcChz
dHJ1Y3QgdWJpX3ZvbHVtZSAqdm9sKSB7fQogI2lmZGVmIENPTkZJR19NVERfVUJJX0JMT0NLCiBp
bnQgdWJpYmxvY2tfaW5pdCh2b2lkKTsKIHZvaWQgdWJpYmxvY2tfZXhpdCh2b2lkKTsKLWludCB1
YmlibG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpOworaW50IHViaWJsb2Nr
X2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSwgc3RydWN0IGRldmljZSAqZGV2KTsK
IGludCB1YmlibG9ja19yZW1vdmUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpOwogI2Vsc2UK
IHN0YXRpYyBpbmxpbmUgaW50IHViaWJsb2NrX2luaXQodm9pZCkgeyByZXR1cm4gMDsgfQogc3Rh
dGljIGlubGluZSB2b2lkIHViaWJsb2NrX2V4aXQodm9pZCkge30KLXN0YXRpYyBpbmxpbmUgaW50
IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSkKK3N0YXRpYyBpbmxp
bmUgaW50IHViaWJsb2NrX2NyZWF0ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZvICp2aSwgc3RydWN0
IGRldmljZSAqZGV2KQogewogCXJldHVybiAtRU5PU1lTOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvdWJpL3ZtdC5jIGIvZHJpdmVycy9tdGQvdWJpL3ZtdC5jCmluZGV4IDEzOWVlMTMyYmZi
Yy4uYzE4YjU3MzljYThlIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC91Ymkvdm10LmMKKysrIGIv
ZHJpdmVycy9tdGQvdWJpL3ZtdC5jCkBAIC0zOCw2ICszOCw4IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2
aWNlX2F0dHJpYnV0ZSBhdHRyX3ZvbF9kYXRhX2J5dGVzID0KIAlfX0FUVFIoZGF0YV9ieXRlcywg
U19JUlVHTywgdm9sX2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKIHN0YXRpYyBzdHJ1Y3QgZGV2aWNl
X2F0dHJpYnV0ZSBhdHRyX3ZvbF91cGRfbWFya2VyID0KIAlfX0FUVFIodXBkX21hcmtlciwgU19J
UlVHTywgdm9sX2F0dHJpYnV0ZV9zaG93LCBOVUxMKTsKK3N0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSBhdHRyX3ZvbF9pZCA9CisJX19BVFRSKGlkLCBTX0lSVUdPLCB2b2xfYXR0cmlidXRl
X3Nob3csIE5VTEwpOwogCiAvKgogICogIlNob3ciIG1ldGhvZCBmb3IgZmlsZXMgaW4gJy88c3lz
ZnM+L2NsYXNzL3ViaS91YmlYX1kvJy4KQEAgLTk0LDYgKzk2LDggQEAgc3RhdGljIHNzaXplX3Qg
dm9sX2F0dHJpYnV0ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcmV0ID0gc3ByaW50Zihi
dWYsICIlbGxkXG4iLCB2b2wtPnVzZWRfYnl0ZXMpOwogCWVsc2UgaWYgKGF0dHIgPT0gJmF0dHJf
dm9sX3VwZF9tYXJrZXIpCiAJCXJldCA9IHNwcmludGYoYnVmLCAiJWRcbiIsIHZvbC0+dXBkX21h
cmtlcik7CisJZWxzZSBpZiAoYXR0ciA9PSAmYXR0cl92b2xfaWQpCisJCXJldCA9IHNwcmludGYo
YnVmLCAiJWRcbiIsIHZvbC0+dm9sX2lkKTsKIAllbHNlCiAJCS8qIFRoaXMgbXVzdCBiZSBhIGJ1
ZyAqLwogCQlyZXQgPSAtRUlOVkFMOwpAQCAtMTE2LDYgKzEyMCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
YXR0cmlidXRlICp2b2x1bWVfZGV2X2F0dHJzW10gPSB7CiAJJmF0dHJfdm9sX3VzYWJsZV9lYl9z
aXplLmF0dHIsCiAJJmF0dHJfdm9sX2RhdGFfYnl0ZXMuYXR0ciwKIAkmYXR0cl92b2xfdXBkX21h
cmtlci5hdHRyLAorCSZhdHRyX3ZvbF9pZC5hdHRyLAogCU5VTEwKIH07CiBBVFRSSUJVVEVfR1JP
VVBTKHZvbHVtZV9kZXYpOwpAQCAtNTU1LDYgKzU2MCw3IEBAIGludCB1YmlfcmVuYW1lX3ZvbHVt
ZXMoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgc3RydWN0IGxpc3RfaGVhZCAqcmVuYW1lX2xpc3Qp
CiAJCQltZW1jcHkodm9sLT5uYW1lLCByZS0+bmV3X25hbWUsIHJlLT5uZXdfbmFtZV9sZW4gKyAx
KTsKIAkJCXNwaW5fdW5sb2NrKCZ1YmktPnZvbHVtZXNfbG9jayk7CiAJCQl1Ymlfdm9sdW1lX25v
dGlmeSh1YmksIHZvbCwgVUJJX1ZPTFVNRV9SRU5BTUVEKTsKKwkJCWtvYmplY3RfdWV2ZW50KCZ2
b2wtPmRldi5rb2JqLCBLT0JKX0NIQU5HRSk7CiAJCX0KIAl9CiAK
--000000000000682f4c05906a5eef
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000682f4c05906a5eef--

