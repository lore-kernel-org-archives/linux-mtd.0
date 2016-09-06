Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhMGf-0000QD-KL
 for linux-mtd@lists.infradead.org; Tue, 06 Sep 2016 19:42:50 +0000
Received: by mail-oi0-x241.google.com with SMTP id w78so11078253oie.0
 for <linux-mtd@lists.infradead.org>; Tue, 06 Sep 2016 12:42:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1468854585-9705-1-git-send-email-zajec5@gmail.com>
References: <1468833493-28311-1-git-send-email-zajec5@gmail.com>
 <1468854585-9705-1-git-send-email-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 6 Sep 2016 21:42:28 +0200
Message-ID: <CACna6ry8YryvvpcVp3hCA-42DX2y9=8hx+807fF2Ri=79dV4Eg@mail.gmail.com>
Subject: Re: [PATCH V2] nanddump: check write function result for errors
To: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 July 2016 at 17:09, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> Errors may happen, it's e.g. easy on embedded devices to run out of space
> when dumping big partitions. This patch adds a helper function for
> writing. It deals with partial writes and just returns 0 on success or
> error number.
>
> The old code didn't check for errors at all which could result in
> incomplete dumps without exiting with an error.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Can this finally be pushed, please?
