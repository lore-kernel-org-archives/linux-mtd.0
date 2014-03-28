Received: from mail-qg0-f46.google.com ([209.85.192.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTZ5Z-0002Yd-5g
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 15:53:01 +0000
Received: by mail-qg0-f46.google.com with SMTP id 63so1024555qgz.19
 for <linux-mtd@lists.infradead.org>; Fri, 28 Mar 2014 08:52:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
Date: Fri, 28 Mar 2014 09:52:37 -0600
Message-ID: <CALnQHM3Yn01qJdpHaqhA3Z+onVeaROTF0esv7S-ctY3y7dgNjw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
From: David Mosberger <davidm@egauge.net>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Gerhard Sittig <gsi@denx.de>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 27, 2014 at 12:56 AM, Gupta, Pekon <pekon@ti.com> wrote:

>>+      set_on_die_ecc(mtd, chip, 1);
>>+
>>+      chkoob = chkbuf + mtd->writesize;
>>+      rawoob = rawbuf + mtd->writesize;
>>+      eccpos = chip->ecc.layout->eccpos;
>>+      for (i = 0; i < chip->ecc.steps; ++i) {
>>+              /* Count bit flips in the actual data area: */
>>+              flips = bitdiff(chkbuf, rawbuf, chip->ecc.size);
>>+              /* Count bit flips in the ECC bytes: */
>>+              for (j = 0; j < chip->ecc.bytes; ++j) {
>
> You should check bit-flips in complete OOB region (mtd->oobsize) not just ecc.bytes.

I was under the impression that OOB data bytes cannot be assumed to be
ECC protected.
As it happens, when using Internal ECC on those Micron chips, *some*
of the OOB databytes
are ECC protected, but I didn't think it was necessary to count those
for bitflips, since OOB users
won't assume ECC protection anyhow.  Am I wrong about that?

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
