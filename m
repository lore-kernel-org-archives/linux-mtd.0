Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2hd2-0001UD-8X
 for linux-mtd@lists.infradead.org; Tue, 17 May 2016 16:13:52 +0000
Received: by mail-oi0-x22e.google.com with SMTP id x19so32721661oix.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 May 2016 09:13:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
Date: Tue, 17 May 2016 18:13:30 +0200
Message-ID: <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: multipart/mixed; boundary=001a113d26a09cd12305330c05d7
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001a113d26a09cd12305330c05d7
Content-Type: text/plain; charset=UTF-8

On Tue, May 17, 2016 at 5:19 PM, Martin Townsend
<mtownsend1973@gmail.com> wrote:
> Hi,
>
> I've just seen the following UBIFS assert which relates to
> ubifs_remount_fs in fs/ubifs/super.c
> We have a read only root filesystem and it looks like this problem
> occurs after rebooting the board when the root filesystem has been
> remounted as as r/w, I use the following command to do this in case
> I'm doing this incorrectly.
> mount -o remount,rw /
> The only way to stop it is to login and run
> mount -o remount,rw /
> mount -o remount,ro /
> and then reboots do not assert.
>
> I've tried a few times now and can happily reproduce it.
>
> Any ideas on how to fix this?

Let's analyze the root cause first.
Can you please reproduce with the attached debug patch applied?
I wonder what the value of c->lst.taken_empty_lebs is.

-- 
Thanks,
//richard

--001a113d26a09cd12305330c05d7
Content-Type: text/plain; charset=US-ASCII; name="ubifs_assert.diff"
Content-Disposition: attachment; filename="ubifs_assert.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iobn2fj60

ZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3N1cGVyLmMgYi9mcy91Ymlmcy9zdXBlci5jCmluZGV4IGU5
OGMyNGUuLjc1MTRmYWIgMTAwNjQ0Ci0tLSBhL2ZzL3ViaWZzL3N1cGVyLmMKKysrIGIvZnMvdWJp
ZnMvc3VwZXIuYwpAQCAtMTg3MCw3ICsxODcwLDExIEBAIHN0YXRpYyBpbnQgdWJpZnNfcmVtb3Vu
dF9mcyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdzLCBjaGFyICpkYXRhKQogCQlj
LT5idS5idWYgPSBOVUxMOwogCX0KIAotCXViaWZzX2Fzc2VydChjLT5sc3QudGFrZW5fZW1wdHlf
bGVicyA+IDApOworCWlmICghKGMtPmxzdC50YWtlbl9lbXB0eV9sZWJzID4gMCkpIHsKKwkJdWJp
ZnNfZXJyKGMsICJ0YWtlbl9lbXB0eV9sZWJzIGlzICVpIiwgYy0+bHN0LnRha2VuX2VtcHR5X2xl
YnMpOworCQl1Ymlmc19hc3NlcnQoMCk7CisJfQorCiAJcmV0dXJuIDA7CiB9CiAK
--001a113d26a09cd12305330c05d7--
