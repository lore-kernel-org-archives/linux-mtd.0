Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CDECDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 03:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzcnqsFwfmRkZiv5nTrJeJc8ddZnxnZKa1kglFss3qE=; b=KIBuxAYn3kCxOk
	5tYK2jSu3l/0YQ577KpU8Unz5ly3Ujgvf4T66Qovh4/0pupbXUtT24oZTqBkqdJlLEQq3s78dXJzH
	IDJlf+tgIs4zClDeLrrggcKoqa6j8OclEfBg8A2+wedzXmqwqK1c8b/VbtSFbX+IqrqxeDsuH25eO
	/3y0J71xAUZYS0uHTnai4O7+inmMsijZVrYlWky8fWGmhHL7YiWJ3GIsz+nBu1jqQKT7H2heHvND0
	AX09r91dwzI1HQ21S0JKXwIBPxsBY0qAZge8q6MXUImbeezseTV47ABgOzVqPy/dQB893dkk8sNkR
	9zm6eI0DFbbtw+FlZ7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqma0-00HIN0-15;
	Thu, 12 Oct 2023 03:41:44 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqmZx-00HILH-0V
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 03:41:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so772641e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Oct 2023 20:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697082091; x=1697686891; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UqD/7t0pHiD/A1D+TVC0jVRhUdy6D5qb2bjFC/PdJc4=;
        b=lmkOd1AOsaJ1zE7cgWhIVEDxrLuGJFgYkrLU7sUmvmIbvPenPJYtVKtWrveNzfRbS6
         ciIOpOW50b0zaOYVjC/tfa4BdfFUy9Ucy7LXpSxA3rml/Ho8tiGfoqLl1bfGNPXuwwru
         pjLTIZPGBDS8pVd68Xf5T6BBkgKmstzt7F9DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697082091; x=1697686891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqD/7t0pHiD/A1D+TVC0jVRhUdy6D5qb2bjFC/PdJc4=;
        b=lYEvfq7gEPzQeoizYMQ83QiMBIdk9q/cgy4I7afy10lAnPWzIUFCbMqkg04Qmdo3pv
         Wz/8siSS/Qh4a/eO8vzcQTXG4RAhfr1b1iqjeYyQOZIYdIPpZMkYjFTqfZFtckAlwW0Y
         MOBgcNc1v8Dk86zijUpjKfC21C1ngb3fVnvOeqIb9dvipGVuKJJbJrmU/tW2VJ3PT7Ps
         /AuydcU9B13fU/l0eeTN7EZRsZXFSsWdC/nq2pGuLR5NZ9agdCa+kPKByp/8bDSv1gp1
         ARtVY5OREjh6g6wpivWc2DjYSwk1ZODeYw71ZBEudRM8QbL2W2v5cFIKWEZWjR9KtIOI
         6glA==
X-Gm-Message-State: AOJu0YyVDSUERN6df/8pwBMwEG5WQuxT+VExMYBYbVn5Wh4MAxROYv2j
	7C5HoEPkS0HKZrTGa4Q35iMMTEawCiAKaClN8KudC+ylY1gDXciOh60=
X-Google-Smtp-Source: AGHT+IGjcdHHqUks4N3VBxCSI9q5rZhvus8FmGXhe4gZvXBEhWqxZiJ8sEB9S33VnjgEGWvOwy3ON0YBJKirqAyhjiM=
X-Received: by 2002:a19:a414:0:b0:502:a55b:c2d7 with SMTP id
 q20-20020a19a414000000b00502a55bc2d7mr19256311lfc.60.1697082090831; Wed, 11
 Oct 2023 20:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231009201005.1964794-1-sjg@chromium.org> <20231009201005.1964794-2-sjg@chromium.org>
 <169688631230.3255827.3268332902446136449.robh@kernel.org>
 <CAPnjgZ3-eX5r02K_499wz3dQOs8nOO5o16CL9w1xyNsTXL0L2A@mail.gmail.com> <20231010170600.GA1046256-robh@kernel.org>
In-Reply-To: <20231010170600.GA1046256-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 11 Oct 2023 20:40:58 -0700
Message-ID: <CAPnjgZ1dX9QUJ1cv4z8k1ptyWm2sk=ax_8vQzYUs5erA+VJ7bg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: binman-partition: Add binman compatibles
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tom Rini <trini@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_204141_193865_0835B978 
X-CRM114-Status: GOOD (  32.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Tue, 10 Oct 2023 at 11:06, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Oct 09, 2023 at 04:02:40PM -0600, Simon Glass wrote:
> > Hi Rob,
> >
> > On Mon, 9 Oct 2023 at 15:18, Rob Herring <robh@kernel.org> wrote:
> > >
> > >
> > > On Mon, 09 Oct 2023 14:10:00 -0600, Simon Glass wrote:
> > > > Add two compatible for binman entries, as a starting point for the
> > > > schema.
> > > >
> > > > Note that, after discussion on v2, we decided to keep the existing
> > > > meaning of label so as not to require changes to existing userspace
> > > > software when moving to use binman nodes to specify the firmware
> > > > layout.
> > > >
> > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > ---
> > > >
> > > > Changes in v3:
> > > > - Drop fixed-partitions from the example
> > > > - Use compatible instead of label
> > > >
> > > > Changes in v2:
> > > > - Use plain partition@xxx for the node name
> > > >
> > > >  .../mtd/partitions/binman-partition.yaml      | 48 +++++++++++++++++++
> > > >  1 file changed, 48 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
> > > >
> > >
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml: properties:compatible:items: {'enum': ['u-boot', 'atf-bl31']} is not of type 'array'
> > >         from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
> > >
> > > doc reference errors (make refcheckdocs):
> > >
> > > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231009201005.1964794-2-sjg@chromium.org
> > >
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> > >
> > > Please check and re-submit after running the above command yourself. Note
> > > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > > your schema. However, it must be unset to test all examples with your schema.
> > >
> >
> > Oh dear, I didn't notice that output but I see it now. Could the check
> > return a non-zero exit code if something goes wrong?
>
> No, because things go wrong too often and then it breaks for everyone.
> It's better now, but only because of the above reports and 3
> maintainers.
>
> Also, it is not fatal. The schemas are checked against the DT
> meta-schema, but are used for validation if they pass just draft2019-09
> meta-schema. That allows new DT meta-schema checks to not start
> excluding previously used schema.

OK I see. Another suggestion would be to remove non-warning output.
Perhaps I can do that with make -s though.

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
