From: sergei.shtylyov@cogentembedded.com (Sergei Shtylyov)
Date: Wed, 16 Jan 2019 20:49:33 +0300
Subject: [PATCH 0/2] Untangle Spansion S25F{L|S}512S chip IDs
Message-ID: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello!

Here's the set of 2 patches against the 'spi-nor/next' branch of 'linux-mtd.git'
repo. We're untangling the S25FS512S being taken for S25FL512S by the SPI NOR code
due to omitting the family ID byte in the latter chip's ID. I'm proposing to use
the full 6-byte JEDEC ID for both these chips.

[1/2] mtd: spi-nor: add Spansion S25FS512S ID
[2/2] mtd: spi-nor: refine Spansion S25FL512S ID

MBR, Sergei
